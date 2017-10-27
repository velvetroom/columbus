import MapKit

extension MCreateSave
{
    //MARK: private
    
    private class func factoryMapPoints(
        stops:[DPlanStop]) -> [MKMapPoint]
    {
        var points:[MKMapPoint] = []
        
        for stop:DPlanStop in stops
        {
            let mapPoint:MKMapPoint = MKMapPointForCoordinate(
                stop.coordinate)
            
            points.append(mapPoint)
        }
        
        return points
    }
    
    private class func factoryMapRange(
        mapPoints:[MKMapPoint]) -> MCreateSaveMapRange?
    {
        var mapRange:MCreateSaveMapRange?
        
        for mapPoint:MKMapPoint in mapPoints
        {
            guard
                
                mapRange == nil
                
            else
            {
                mapRange = mapRange?.comparingMapPoint(
                    mapPoint:mapPoint)
                
                continue
            }
            
            mapRange = MCreateSaveMapRange.fromMapPoint(
                mapPoint:mapPoint)
        }
        
        return mapRange
    }
    
    //MARK: internal
    
    class func factoryMapRange(
        stops:[DPlanStop]) -> MCreateSaveMapRange?
    {
        let mapPoints:[MKMapPoint] = factoryMapPoints(
            stops:stops)
        let mapRange:MCreateSaveMapRange? = factoryMapRange(
            mapPoints:mapPoints)
        
        return mapRange
    }
}
