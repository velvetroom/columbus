import MapKit

extension VCreateStatusReadyMap:MKMapViewDelegate
{
    //MARK: private
    
    private func viewForStop(
        stop:DPlanStop) -> VCreateStatusReadyMapPin
    {
        guard
            
            let view:VCreateStatusReadyMapPin = dequeueReusableAnnotationView(
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
    
    private func viewForUser(
        annotation:MKAnnotation) -> MKAnnotationView?
    {
        let annotationView:MKAnnotationView? = view(
            for:annotation)
        
        return annotationView
    }
    
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
        centreCoordinate(
            coordinate:userLocation.coordinate)
        userLocation.title = nil
    }
    
    func mapView(
        _ mapView:MKMapView,
        viewFor annotation:MKAnnotation) -> MKAnnotationView?
    {
        guard
        
            let stop:DPlanStop = annotation as? DPlanStop
        
        else
        {
            let view:MKAnnotationView? = viewForUser(
                annotation:annotation)
            
            return view
        }
        
        let view:VCreateStatusReadyMapPin = viewForStop(
            stop:stop)
        
        return view
    }
}
