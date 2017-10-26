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
        
        factoryTravel(
            database:database,
            mode:destinationTravel.mode,
            origin:previousStop,
            destination:nextStop,
            completion:completion)
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
