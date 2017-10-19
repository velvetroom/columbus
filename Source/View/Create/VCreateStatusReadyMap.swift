import MapKit

final class VCreateStatusReadyMap:MKMapView
{
    private let span:MKCoordinateSpan
    private let kSpanSize:CLLocationDegrees = 0.01
    
    init()
    {
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
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(
            userCoordinated,
            span)
        
        setRegion(region, animated:true)
        selectAnnotation(userLocation, animated:true)
    }
}
