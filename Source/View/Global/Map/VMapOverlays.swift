import MapKit

extension VMap
{
    //MARK: internal
    
    final func addStop(stop:DPlanStop)
    {
        addAnnotation(stop)
        
        guard
            
            let travel:DPlanTravel = stop.destinationTravel
            
        else
        {
            return
        }
        
        addRoute(travel:travel)
    }
    
    final func addRoute(travel:DPlanTravel)
    {
        guard
            
            let route:MKPolyline = travel.polyline
            
        else
        {
            return
        }
        
        add(
            route,
            level:MKOverlayLevel.aboveLabels)
    }
    
    final func removeRoute(travel:DPlanTravel)
    {
        guard
            
            let route:MKPolyline = travel.polyline
            
        else
        {
            return
        }
        
        remove(route)
    }
}
