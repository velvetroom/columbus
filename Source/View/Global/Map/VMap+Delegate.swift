import MapKit

extension VMap
{
    //MARK: internal
    
    final func didUpdate(userLocation:MKUserLocation)
    {
        guard
            
            let location:CLLocation = userLocation.location,
            location.horizontalAccuracy < VMap.Constants.distanceAccuracy,
            shouldUpdate
            
        else
        {
            return
        }
        
        shouldUpdate = false
        centreCoordinateRegion(coordinate:userLocation.coordinate)
        userLocation.title = nil
    }
    
    final func viewFor(annotation:MKAnnotation) -> MKAnnotationView?
    {
        guard
            
            let stop:DPlanStop = annotation as? DPlanStop
            
        else
        {
            let view:MKAnnotationView? = factoryUser(annotation:annotation)
            
            return view
        }
        
        let view:VMapPin = factoryPin(stop:stop)
        
        return view
    }
    
    final func rendererFor(overlay:MKOverlay) -> MKOverlayRenderer
    {
        let renderer:MKOverlayRenderer = factoryRenderer(overlay:overlay)
        
        return renderer
    }
}
