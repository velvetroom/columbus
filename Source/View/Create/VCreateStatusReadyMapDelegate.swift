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
        centreCoordinateRegion(
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
            let view:MKAnnotationView? = factoryUser(
                annotation:annotation)
            
            return view
        }
        
        let view:VCreateStatusReadyMapPin = factoryPin(
            stop:stop)
        
        return view
    }
    
    func mapView(
        _ mapView:MKMapView,
        didSelect view:MKAnnotationView)
    {
        selectedAnnotation(annotation:view)
    }
    
    func mapView(
        _ mapView:MKMapView,
        didDeselect view:MKAnnotationView)
    {
        deselectAnnotation()
    }
    
    func mapView(
        _ mapView:MKMapView,
        annotationView view:MKAnnotationView,
        didChange newState:MKAnnotationViewDragState,
        fromOldState oldState:MKAnnotationViewDragState)
    {
        dragingChanged(
            annotation:view,
            state:newState)
    }
    
    func mapView(
        _ mapView:MKMapView,
        rendererFor overlay:MKOverlay) -> MKOverlayRenderer
    {
        let renderer:MKOverlayRenderer = factoryRenderer(
            overlay:overlay)
        
        return renderer
    }
    
    func mapViewDidFinishRenderingMap(
        _ mapView:MKMapView,
        fullyRendered:Bool)
    {
        mapView.region
        print("did finish tiles")
    }
}
