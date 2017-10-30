import MapKit

extension VMap
{
    //MARK: internal
    
    final func config()
    {
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
        userTrackingMode = MKUserTrackingMode.follow
    }
}
