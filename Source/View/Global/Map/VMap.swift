import MapKit

class VMap<A>:
    MKMapView,
    MKMapViewDelegate
    where A.C:Controller<A>
{
    private(set) weak var controller:A.C!
    let span:MKCoordinateSpan
    let rendererStrokeColour:UIColor
    let kRendererLineDash:[NSNumber] = [1, 10]
    let kRendererWidth:CGFloat = 6
    private var shouldUpdate:Bool
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
        
        let view:VMapPin = factoryPin(
            stop:stop)
        
        return view
    }
    
    func mapView(
        _ mapView:MKMapView,
        rendererFor overlay:MKOverlay) -> MKOverlayRenderer
    {
        let renderer:MKOverlayRenderer = factoryRenderer(
            overlay:overlay)
        
        return renderer
    }
}
