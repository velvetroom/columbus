import MapKit

extension VMap:MKMapViewDelegate
{
    //MARK: internal
    
    final func didUpdate(userLocation:MKUserLocation)
    {
        guard
            
            shouldUpdate
            
        else
        {
            return
        }
        
        shouldUpdate = false
        centreCoordinateRegion(
            coordinate:userLocation.coordinate)
        userLocation.title = nil
    }
    
    final func viewFor(annotation:MKAnnotation) -> MKAnnotationView?
    {
        guard
            
            let stop:DPlanStop = annotation as? DPlanStop
            
        else
        {
            let view:MKAnnotationView? = factoryUser(
                annotation:annotation)
            
            return view
        }
        
        let view:VCreateStatusReadyMapPin = factoryPin(
            stop:stop)
        
        return view
    }
}
