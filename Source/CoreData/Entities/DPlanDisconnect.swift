import Foundation

extension DPlan
{
    //MARK: private
    
    private func reconnectOrigin(
        database:Database,
        stop:DPlanStop,
        completion:@escaping(() -> ()))
    {
        guard
        
            let previousStop:DPlanStop = stop.originTravel?.origin
        
        else
        {
            reconnectDestination(
                database:database,
                stop:stop,
                completion:completion)
            
            return
        }
        
        database.create
        { [weak self] (travel:DPlanTravel) in
            
            self?.newOrigin(
                database:database,
                stop:stop,
                origin:previousStop,
                travel:travel,
                completion:completion)
        }
    }
    
    private func reconnectDestination(
        database:Database,
        stop:DPlanStop,
        completion:@escaping(() -> ()))
    {
        
    }
    
    private func newOrigin(
        database:Database,
        stop:DPlanStop,
        origin:DPlanStop,
        travel:DPlanTravel,
        completion:@escaping(() -> ()))
    {
        travel.origin = origin
        travel.destination = stop
        
        if let travelMode:DPlanTravelMode = stop.originTravel?.mode
        {
            travel.mode = travelMode
        }
        
        reconnectDestination(
            database:database,
            stop:stop,
            completion:completion)
    }
    
    //MARK: internal
    
    func disconnect(
        database:Database,
        stop:DPlanStop,
        completion:@escaping(() -> ()))
    {
        stop.plan = nil
        
        reconnectOrigin(
            database:database,
            stop:stop,
            completion:completion)
    }
}
