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
}
