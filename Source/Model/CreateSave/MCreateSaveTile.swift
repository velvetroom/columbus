import Foundation

extension MCreateSave
{
    //MARK: internal
    
    func tiles(
        mapRange:MCreateSaveMapRange,
        zoom:Double) -> MCreateSaveRender
    {
        let pixelRange:MCreateSaveMapRange = mapRange.factoryPixelRange(
            zoom:zoom)
    }
}
