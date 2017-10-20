import MapKit

extension VCreateStatusReadyMap:MKMapViewDelegate
{
    //MARK: internal
    
    func mapView(
        _ mapView:MKMapView,
        didUpdate userLocation:MKUserLocation)
    {
        guard
            
            shouldUpdate
            
        else
        {
            return
        }
        
        shouldUpdate = false
        centerLocation(
            locationCoordinate:userLocation.coordinate)
    }
    
    func mapView(
        _ mapView:MKMapView,
        viewFor annotation:MKAnnotation) -> MKAnnotationView?
    {
        guard
        
            let annotation:DPlanStop = annotation as? DPlanStop
        
        else
        {
            return nil
        }
        
        return nil
    }
}
