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
    let kRendererLineDash:[NSNumber] = [1, 10]
    let kRendererWidth:CGFloat = 6
    private let kSpanSize:CLLocationDegrees = 0.03
    
    init(controller:A.C)
    {
        shouldUpdate = true
        span = MKCoordinateSpan(
            latitudeDelta:kSpanSize,
            longitudeDelta:kSpanSize)
        rendererStrokeColour = UIColor.colourSuccess.withAlphaComponent(
            0.6)
        
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
        let view:MKAnnotationView? = viewFor(
            annotation:annotation)
        
        return view
    }
    
    func mapView(
        _ mapView:MKMapView,
        rendererFor overlay:MKOverlay) -> MKOverlayRenderer
    {
        let renderer:MKOverlayRenderer = rendererFor(
            overlay:overlay)
        
        return renderer
    }
}
