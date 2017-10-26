import Foundation

extension MCreatePlan
{
    private func asyncRemove(stop:DPlanStop)
    {
        guard
            
            let database:Database = model?.database
            
        else
        {
            return
        }
        
        database.delete(data:stop)
        { [weak self] in
            
            self?.removed(
                database:database,
                stop:stop)
        }
    }
    
    private func removed(
        database:Database,
        stop:DPlanStop)
    {
        plan.disconnect(
            database:database,
            stop:stop)
        { [weak self] in
            
            self?.removedDone(stop:stop)
        }
    }
    
    private func removedDone(stop:DPlanStop)
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.updateStops()
        }
    }
    
    //MARK: internal
    
    func remove(stop:DPlanStop)
    {
        removeAnnotation(stop:stop)
        
        DispatchQueue.global(
            qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncRemove(stop:stop)
        }
    }
}
