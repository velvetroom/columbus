import MapKit

extension VHomeReadyMap:MKMapViewDelegate
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
}
