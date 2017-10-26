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
        
        factoryTravel(
            database:database,
            mode:settings.travelMode,
            origin:lastStop,
            destination:stop)
        { (travel:DPlanTravel) in
            
            completion()
        }
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
