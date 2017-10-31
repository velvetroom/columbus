import UIKit

extension MCreateSave
{
    //MARK: private
    
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
        
        return picture
    }
    
    //MARK: internal
    
    class func factoryImages(
        snapshot:UIImage,
        zoom:Double,
        slice:MCreateSaveRenderSlice) -> [MCreateSavePicture]
    {
        let tileSize:Int = Int(kTileSize * kTileScale)
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
}
