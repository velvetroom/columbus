import Foundation

extension MCreateSave
{
    //MARK: internal
    
    func tiles(
        mapRange:MCreateSaveMapRange,
        zoom:Double) -> MCreateSaveRender
    {
        let pixelRange:MCreateSavePixelRange = mapRange.factoryPixelRange(
            zoom:zoom)
        let tileRange:MCreateSaveTileRange = pixelRange.factoryTileRange(
            tileSize:kTileSize)
        let boundingTileRange:MCreateSaveTileRange = factoryBoundingTileRange(
            tileRange:tileRange)
        
        let render:MCreateSaveRender = tiles(
            tileRange:boundingTileRange)
        
        return render
    }
}
