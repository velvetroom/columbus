import MapKit

extension MCreateSaveMapRange
{
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
    
    func factoryMapRect() -> MKMapRect
    {
        let width:Double = maxX - minX
        let height:Double = maxY - minY
        
        let mapRect:MKMapRect = MKMapRectMake(
            minX,
            minY,
            width,
            height)
        
        return mapRect
    }
}
