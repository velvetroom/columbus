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
    
    func coordinateAtCentre() -> CLLocationCoordinate2D
    {
        let midX:CGFloat = bounds.midX
        let midY:CGFloat = bounds.midY
        let point:CGPoint = CGPoint(
            x:midX,
            y:midY)
        
        let location:CLLocationCoordinate2D = convert(
            point,
            toCoordinateFrom:self)
        
        return location
    }
}
