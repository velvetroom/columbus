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
        
            let stop:DPlanStop = annotation as? DPlanStop
        
        else
        {
            return nil
        }
        
        guard
        
            let view:VCreateStatusReadyMapPin = mapView.dequeueReusableAnnotationView(
                withIdentifier:
                VCreateStatusReadyMapPin.reusableIdentifier) as? VCreateStatusReadyMapPin
        
        else
        {
            let view:VCreateStatusReadyMapPin = VCreateStatusReadyMapPin(
                stop:stop)
            
            return view
        }
        
        view.annotation = stop
        
        return view
    }
}
