import Foundation

extension MCreatePlan
{
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
            
            self?.removeAnnotation(stop:stop)
            self?.updateStops()
        }
    }
    
    //MARK: internal
    
    func remove(stop:DPlanStop)
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
}
