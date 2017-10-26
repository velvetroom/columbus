import Foundation

extension DPlan
{
    //MARK: internal
    
    func factoryTravel(
        database:Database,
        mode:DPlanTravelMode,
        origin:DPlanStop,
        destination:DPlanStop,
        completion:@escaping((DPlanTravel) -> ()))
    {
        database.create
        { [weak self] (travel:DPlanTravel) in
            
            travel.plan = self
            travel.mode = mode
            travel.origin = origin
            travel.destination = destination
            
            completion(travel)
        }
    }
}
