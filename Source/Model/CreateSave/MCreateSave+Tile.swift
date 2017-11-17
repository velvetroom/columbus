import Foundation

extension MCreateSave
{
    //MARK: internal
    
    class func tiles(
        mapRange:MCreateSaveMapRange,
        zoom:Double) -> MCreateSaveRender
    {
        let pixelRange:MCreateSavePixelRange = mapRange.factoryPixelRange(
            zoom:zoom)
        let tileRange:MCreateSaveTileRange = pixelRange.factoryTileRange(
            tileSize:MCreateSave.Constants.Tile.size)
        let boundingTileRange:MCreateSaveTileRange = factoryBoundingTileRange(
            tileRange:tileRange)
        
        let render:MCreateSaveRender = boundingTileRange.factoryRender()
        
        return render
    }
}
