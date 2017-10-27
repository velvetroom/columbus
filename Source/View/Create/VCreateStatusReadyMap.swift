import MapKit

final class VCreateStatusReadyMap:MKMapView
{
    private(set) weak var controller:CCreate!
    private(set) weak var mapTiler:VCreateStatusReadyMapTiler!
    var shouldUpdate:Bool
    let span:MKCoordinateSpan
    let rendererStrokeColour:UIColor
    let kRendererLineDash:[NSNumber] = [1, 10]
    let kRendererWidth:CGFloat = 6
    private let kSpanSize:CLLocationDegrees = 0.03
    
    init(controller:CCreate)
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
        
        addTiler()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func addTiler()
    {
        let mapTiler:VCreateStatusReadyMapTiler = VCreateStatusReadyMapTiler()
        self.mapTiler = mapTiler
        
        add(
            mapTiler,
            level:MKOverlayLevel.aboveLabels)
    }
}
