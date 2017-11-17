import MapKit

extension MCreateSaveMapRange
{
    //MARK: private
    
    private func factoryPixelZoom(
        zoom:Double) -> Double
    {
        let pixelZoomInt:Int = 1 << Int(zoom)
        let pixelZoom:Double = Double(pixelZoomInt)
        
        return pixelZoom
    }
    
    //MARK: internal
    
    static func fromMapPoint(
        mapPoint:MKMapPoint) -> MCreateSaveMapRange
    {
        let pointX:Double = mapPoint.x
        let pointY:Double = mapPoint.y
        
        let mapRange:MCreateSaveMapRange = MCreateSaveMapRange(
            minX:pointX,
            maxX:pointX,
            minY:pointY,
            maxY:pointY)
        
        return mapRange
    }
    
    func comparingMapPoint(
        mapPoint:MKMapPoint) -> MCreateSaveMapRange
    {
        let minX:Double = min(self.minX, mapPoint.x)
        let maxX:Double = max(self.maxX, mapPoint.x)
        let minY:Double = min(self.minY, mapPoint.y)
        let maxY:Double = max(self.maxY, mapPoint.y)
        
        let newRange:MCreateSaveMapRange = MCreateSaveMapRange(
            minX:minX,
            maxX:maxX,
            minY:minY,
            maxY:maxY)
        
        return newRange
    }
    
    func factoryPixelRange(
        zoom:Double) -> MCreateSavePixelRange
    {
        let pixelZoom:Double = factoryPixelZoom(
            zoom:zoom)
        let pixelTranslated:Double = pixelZoom / MCreateSave.Constants.Map.appleToGoogle
        
        let minX:Double = self.minX * pixelTranslated
        let maxX:Double = self.maxX * pixelTranslated
        let minY:Double = self.minY * pixelTranslated
        let maxY:Double = self.maxY * pixelTranslated
        
        let pixelRange:MCreateSavePixelRange = MCreateSavePixelRange(
            zoom:zoom,
            pixelZoom:pixelZoom,
            minX:minX,
            maxX:maxX,
            minY:minY,
            maxY:maxY)
        
        return pixelRange
    }
}
