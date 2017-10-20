import MapKit

extension VCreateStatusReadyMap
{
    //MARK: internal
    
    func centreUser()
    {
        guard
            
            let coordinate:CLLocationCoordinate2D = userLocation.location?.coordinate
            
        else
        {
            return
        }
        
        centreCoordinate(coordinate:coordinate)
        selectAnnotation(userLocation, animated:true)
    }
    
    func centreCoordinate(coordinate:CLLocationCoordinate2D)
    {
        let region:MKCoordinateRegion = MKCoordinateRegionMake(
            coordinate,
            span)
        
        setRegion(region, animated:true)
    }
}
