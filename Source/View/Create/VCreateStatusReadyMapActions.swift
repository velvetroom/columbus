import MapKit

extension VCreateStatusReadyMap
{
    //MARK: internal
    
    func addStop(stop:DPlanStop)
    {
        addAnnotation(stop)
        centreAndSelect(
            stop:stop)
        
        guard
            
            let travel:DPlanTravel = stop.destinationTravel
            
        else
        {
            return
        }
        
        addRoute(travel:travel)
    }
    
    func addRoute(travel:DPlanTravel)
    {
        guard
            
            let route:MKPolyline = travel.polyline
            
        else
        {
            return
        }
        
        add(
            route,
            level:MKOverlayLevel.aboveRoads)
    }
    
    func removeStop(stop:DPlanStop)
    {
        removeAnnotation(stop)
        
        if let origin:DPlanTravel = stop.originTravel
        {
            removeRoute(travel:origin)
        }
        
        if let destination:DPlanTravel = stop.destinationTravel
        {
            removeRoute(travel:destination)
        }
    }
    
    func removeRoute(travel:DPlanTravel)
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
