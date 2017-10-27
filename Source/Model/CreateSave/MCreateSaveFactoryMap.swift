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
    
    //MARK: internal
    
    class func factoryMapRange(
        stops:[DPlanStop]) -> MCreateSaveMapRange?
    {
        let mapPoints:[MKMapPoint] = factoryMapPoints(
            stops:stops)
    }
}
