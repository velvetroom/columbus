import Foundation

extension MCreatePlan
{
    private func removed(stop:DPlanStop)
    {
        plan.disconnect(
            database:database,
            stop:stop)
        { [weak self] in
            
            
        }
    }
    
    //MARK: internal
    
    func remove(stop:DPlanStop)
    {
        database.delete(data:stop)
        { [weak self] in
            
            self?.removed(stop:stop)
        }
    }
}
