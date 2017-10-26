import Foundation

extension DPlan
{
    //MARK: private
    
    private func reconnectOrigin(
        database:Database,
        stop:DPlanStop,
        completion:@escaping((DPlanTravel?) -> ()))
    {
        guard
        
            let destinationTravel:DPlanTravel = stop.destinationTravel,
            let originTravel:DPlanTravel = stop.originTravel,
            let previousStop:DPlanStop = destinationTravel.origin,
            let nextStop:DPlanStop = originTravel.destination
        
        else
        {
            completion(nil)
            
            return
        }
        
        database.create
        { (travel:DPlanTravel) in
            
            travel.mode = destinationTravel.mode
            travel.origin = previousStop
            travel.destination = nextStop
            
            completion(travel)
        }
    }
    
    //MARK: internal
    
    func disconnect(
        database:Database,
        stop:DPlanStop,
        completion:@escaping((DPlanTravel?) -> ()))
    {
        stop.plan = nil
        
        reconnectOrigin(
            database:database,
            stop:stop,
            completion:completion)
    }
}
