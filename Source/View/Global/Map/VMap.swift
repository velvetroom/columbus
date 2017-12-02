import MapKit

class VMap<A>:
    MKMapView,
    MKMapViewDelegate
    where A.C:Controller<A>
{
    private(set) weak var controller:A.C!
    var shouldUpdate:Bool
    let span:MKCoordinateSpan
    let rendererStrokeColour:UIColor
    
    init(controller:A.C)
    {
        shouldUpdate = true
        rendererStrokeColour = UIColor.colourBackgroundDark.withAlphaComponent(0.6)
        
        span = MKCoordinateSpan(
            latitudeDelta:VMapTools.Constants.spanSize,
            longitudeDelta:VMapTools.Constants.spanSize)
        
        super.init(frame:CGRect.zero)
        self.controller = controller
        
        config()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: delegate
    
    func mapView(
        _ mapView:MKMapView,
        didUpdate userLocation:MKUserLocation)
    {
        didUpdate(userLocation:userLocation)
    }
    
    func mapView(
        _ mapView:MKMapView,
        viewFor annotation:MKAnnotation) -> MKAnnotationView?
    {
        let view:MKAnnotationView? = viewFor(annotation:annotation)
        
        return view
    }
    
    func mapView(
        _ mapView:MKMapView,
        rendererFor overlay:MKOverlay) -> MKOverlayRenderer
    {
        let renderer:MKOverlayRenderer = rendererFor(overlay:overlay)
        
        return renderer
    }
    
    func mapView(
        _ mapView:MKMapView,
        didSelect view:MKAnnotationView) { }
    
    func mapView(
        _ mapView:MKMapView,
        didDeselect view:MKAnnotationView) { }
    
    func mapView(
        _ mapView:MKMapView,
        annotationView view:MKAnnotationView,
        didChange newState:MKAnnotationViewDragState,
        fromOldState oldState:MKAnnotationViewDragState) { }
}
