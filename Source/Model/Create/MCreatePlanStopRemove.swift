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
        { [weak self] (travel:DPlanTravel?) in
            
            guard
                
                let travel:DPlanTravel = travel
            
            else
            {
                self?.removedDone(stop:stop)
                
                return
            }
            
            self?.addNewTravel(
                travel:travel,
                stop:stop)
        }
    }
    
    private func addNewTravel(
        travel:DPlanTravel,
        stop:DPlanStop)
    {
        factoryDirections(travel:travel)
        { [weak self] in
            
            self?.asyncAdd(travel:travel)
            self?.removedDone(stop:stop)
        }
    }
    
    private func asyncAdd(travel:DPlanTravel)
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.addTravel(travel:travel)
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
