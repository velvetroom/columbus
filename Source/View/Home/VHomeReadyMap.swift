import MapKit

final class VHomeReadyMap:MKMapView
{
    private(set) weak var controller:CHome!
    var shouldUpdate:Bool
    let span:MKCoordinateSpan
    let rendererStrokeColour:UIColor
    let kRendererLineDash:[NSNumber] = [1, 10]
    let kRendererWidth:CGFloat = 6
    private let kSpanSize:CLLocationDegrees = 0.03
    
    init(controller:CHome)
    {
        shouldUpdate = true
        span = MKCoordinateSpan(
            latitudeDelta:kSpanSize,
            longitudeDelta:kSpanSize)
        rendererStrokeColour = UIColor.colourSuccess.withAlphaComponent(
            0.6)
        
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        isRotateEnabled = false
        isScrollEnabled = true
        isZoomEnabled = true
        isPitchEnabled = false
        mapType = MKMapType.standard
        showsBuildings = true
        showsPointsOfInterest = true
        showsCompass = true
        showsScale = true
        showsTraffic = false
        showsUserLocation = true
        userTrackingMode = MKUserTrackingMode.follow
        delegate = self
        self.controller = controller
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
