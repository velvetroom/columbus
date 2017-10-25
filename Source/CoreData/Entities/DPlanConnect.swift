import Foundation

extension DPlan
{
    //MARK: private
    
    private func connect(
        database:Database,
        settings:DSettings,
        stop:DPlanStop,
        lastStop:DPlanStop,
        completion:@escaping(() -> ()))
    {
        stop.plan = self
        
        database.create
        { [weak self] (travel:DPlanTravel) in
            
            travel.initialValues()
            
            self?.connect(
                settings:settings,
                stop:stop,
                lastStop:lastStop,
                travel:travel,
                completion:completion)
        }
    }
    
    private func connect(
        settings:DSettings,
        stop:DPlanStop,
        lastStop:DPlanStop,
        travel:DPlanTravel,
        completion:@escaping(() -> ()))
    {
        travel.mode = settings.travelMode
        travel.origin = lastStop
        travel.destination = stop
        
        completion()
    }
    
    //MARK: internal
    
    func connect(
        database:Database,
        settings:DSettings,
        stop:DPlanStop,
        completion:@escaping(() -> ()))
    {
        guard
        
            let lastStop:DPlanStop = stops?.lastObject as? DPlanStop
        
        else
        {
            stop.plan = self
            completion()
            
            return
        }
        
        connect(
            database:database,
            settings:settings,
            stop:stop,
            lastStop:lastStop,
            completion:completion)
    }
}
