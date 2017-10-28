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
            tileSize:MCreateSave.kTileSize)
        
    }
}
