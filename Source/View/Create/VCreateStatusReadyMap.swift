import MapKit

final class VCreateStatusReadyMap:MKMapView
{
    var shouldUpdate:Bool
    private let span:MKCoordinateSpan
    private let kSpanSize:CLLocationDegrees = 0.03
    
    init()
    {
        shouldUpdate = true
        span = MKCoordinateSpan(
            latitudeDelta:kSpanSize,
            longitudeDelta:kSpanSize)
        
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
        delegate = self
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: internal
    
    func centreUser()
    {
        guard
            
            let userCoordinated:CLLocationCoordinate2D = userLocation.location?.coordinate
            
        else
        {
            return
        }
        
        centerLocation(locationCoordinate:userCoordinated)
        selectAnnotation(userLocation, animated:true)
    }
    
    func centerLocation(locationCoordinate:CLLocationCoordinate2D)
    {
        let region:MKCoordinateRegion = MKCoordinateRegionMake(
            locationCoordinate,
            span)
        
        setRegion(region, animated:true)
    }
}
