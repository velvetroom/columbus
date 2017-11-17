import UIKit

extension MCreateSave
{
    //MARK: private
    
    private class func factoryPictures(
        snapshot:UIImage,
        directory:URL,
        tileSize:Int,
        originX:Int,
        originY:Int,
        z:Int,
        width:Int,
        height:Int) -> [URL]
    {
        var urls:[URL] = []
        
        for indexX:Int in 0 ..< width
        {
            let x:Int = indexX * tileSize
            let tileX:Int = indexX + originX
            
            for indexY:Int in 0 ..< height
            {
                let y:Int = indexY * tileSize
                let tileY:Int = indexY + originY
                
                let cropRect:CGRect = CGRect(
                    x:x,
                    y:y,
                    width:tileSize,
                    height:tileSize)
                
                guard
                
                    let url:URL = factoryPicture(
                        snapshot:snapshot,
                        directory:directory,
                        tileX:tileX,
                        tileY:tileY,
                        z:z,
                        cropRect:cropRect)
                
                else
                {
                    continue
                }
                
                urls.append(url)
            }
        }
        
        return urls
    }
    
    private class func factoryPicture(
        snapshot:UIImage,
        directory:URL,
        tileX:Int,
        tileY:Int,
        z:Int,
        cropRect:CGRect) -> URL?
    {
        guard
        
            let croppedImage:UIImage = snapshot.imageCropping(
                rect:cropRect)
        
        else
        {
            return nil
        }
        
        let picture:MCreateSavePicture = MCreateSavePicture(
            image:croppedImage,
            x:tileX,
            y:tileY,
            z:z)
        
        let url:URL? = savePicture(
            directory:directory,
            picture:picture)
        
        return url
    }
    
    //MARK: internal
    
    class func factoryImages(
        snapshot:UIImage,
        directory:URL,
        zoom:Double,
        slice:MCreateSaveRenderSlice) -> [URL]
    {
        let tileSize:Int = Int(kTileSize * kTileScale)
        let z:Int = Int(zoom)
        let originX:Int = Int(slice.rect.tileX)
        let originY:Int = Int(slice.rect.tileY)
        let width:Int = Int(slice.rect.tileWidth)
        let height:Int = Int(slice.rect.tileHeight)
        
        let urls:[URL] = factoryPictures(
            snapshot:snapshot,
            directory:directory,
            tileSize:tileSize,
            originX:originX,
            originY:originY,
            z:z,
            width:width,
            height:height)
        
        return urls
    }
}
