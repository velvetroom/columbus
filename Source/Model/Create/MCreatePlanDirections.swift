import MapKit

extension MCreatePlan
{
    //MARK: private
  
    private func calculateDirections(
        directions:MKDirections,
        travel:DPlanTravel,
        completion:@escaping(() -> ()))
    {
        directions.calculate
        { [weak self] (
            response:MKDirectionsResponse?,
            error:Error?) in
            
            guard
            
                error == nil,
                let route:MKRoute = response?.routes.first
            
            else
            {
                self?.noRouteFound(
                    travel:travel,
                    completion:completion)
                
                return
            }
            
            self?.calculateDirections(
                route:route,
                travel:travel,
                completion:completion)
        }
    }
    
    private func calculateDirections(
        route:MKRoute,
        travel:DPlanTravel,
        completion:@escaping(() -> ()))
    {
        travel.duration = route.expectedTravelTime
        travel.distance = Float(route.distance)
        travel.route = route.polyline
        travel.status = DPlanTravelStatus.ready
        
        completion()
    }
    
    private func noRouteFound(
        travel:DPlanTravel,
        completion:@escaping(() -> ()))
    {
        travel.cleanValues()
        travel.status = DPlanTravelStatus.routeNotFound
        
        completion()
    }
    
    //MARK: internal
    
    func factoryDirections(
        travel:DPlanTravel,
        completion:@escaping(() -> ()))
    {
        guard
        
            let directions:MKDirections = factoryDirections(
                travel:travel)
        
        else
        {
            return
        }
        
        calculateDirections(
            directions:directions,
            travel:travel,
            completion:completion)
    }
}
