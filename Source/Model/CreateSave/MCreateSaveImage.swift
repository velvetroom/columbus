import UIKit

extension MCreateSave
{
    //MARK: private
    
    private class func factoryPictures(
        snapshot:UIImage,
        zoom:Double,
        slice:MCreateSaveRenderSlice) -> [MCreateSavePicture]
    {
        let tileSize:Int = Int(kTileSize)
        let z:Int = Int(zoom)
        let originX:Int = Int(slice.rect.tileX)
        let originY:Int = Int(slice.rect.tileY)
        let width:Int = Int(slice.rect.tileWidth)
        let height:Int = Int(slice.rect.tileHeight)
        
        let pictures:[MCreateSavePicture] = factoryPictures(
            snapshot:snapshot,
            tileSize:tileSize,
            originX:originX,
            originY:originY,
            z:z,
            width:width,
            height:height)
        
        return pictures
    }
    
    private class func factoryPictures(
        snapshot:UIImage,
        tileSize:Int,
        originX:Int,
        originY:Int,
        z:Int,
        width:Int,
        height:Int) -> [MCreateSavePicture]
    {
        var pictures:[MCreateSavePicture] = []
        
        for indexX:Int in 0 ..< width
        {
            let x:Int = indexX * tileSize
            let tileX:Int = x + originX
            
            for indexY:Int in 0 ..< height
            {
                let y:Int = indexY * tileSize
                let tileY:Int = y + originY
                
                let cropRect:CGRect = CGRect(
                    x:x,
                    y:y,
                    width:tileSize,
                    height:tileSize)
                
                guard
                
                    let picture:MCreateSavePicture = factoryPicture(
                        snapshot:snapshot,
                        tileX:tileX,
                        tileY:tileY,
                        z:z,
                        cropRect:cropRect)
                
                else
                {
                    continue
                }
                
                pictures.append(picture)
            }
        }
        
        return pictures
    }
    
    private class func factoryPicture(
        snapshot:UIImage,
        tileX:Int,
        tileY:Int,
        z:Int,
        cropRect:CGRect) -> MCreateSavePicture?
    {
        
    }
    
    //MARK: internal
    
    class func factoryImages(
        snapshot:UIImage,
        zoom:Double,
        directory:URL,
        slice:MCreateSaveRenderSlice) -> [URL]
    {
        let url:URL = fileSave(
            directory:directory,
            name:"test_snap_\(slice.rect.tileX)_\(slice.rect.tileY).png",
            image:image)
    }
}
