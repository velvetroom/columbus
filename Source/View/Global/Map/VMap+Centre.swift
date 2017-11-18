import MapKit

extension VMap
{
    //MARK: internal
    
    final func centreAndSelect(stop:DPlanStop)
    {
        setCenter(
            stop.coordinate,
            animated:true)
        
        selectAnnotation(
            stop,
            animated:true)
    }
    
    final func centreUser()
    {
        guard
            
            let coordinate:CLLocationCoordinate2D = userLocation.location?.coordinate
            
        else
        {
            return
        }
        
        centreCoordinateRegion(coordinate:coordinate)
        selectedAnnotations = []
    }
    
    final func centreCoordinateRegion(coordinate:CLLocationCoordinate2D)
    {
        let region:MKCoordinateRegion = MKCoordinateRegionMake(
            coordinate,
            span)
        
        setRegion(region, animated:true)
    }
    
    final func coordinateAtCentre() -> CLLocationCoordinate2D
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
