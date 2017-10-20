import Foundation

final class MCreateLocationStrategyReady:MCreateLocationStrategyProtocol
{
    private weak var model:MCreate?
    
    //MARK: private
    
    private func startPlan()
    {
        guard
        
            let database:Database = Database(bundle:nil)
        
        else
        {
            databaseError()
            
            return
        }
        
        database.create
        { [weak self] (coredataPlan:DPlan) in
            
            guard
                
                let model:MCreate = self?.model
            
            else
            {
                return
            }
            
            let modelPlan:MCreatePlan = MCreatePlan(
                model:model,
                database:database,
                plan:coredataPlan)
            
            self?.planReady(plan:modelPlan)
        }
    }
    
    private func databaseError()
    {
        model?.changeStatus(
            statusType:MCreateStatusErrorDatabase.self)
    }
    
    private func planReady(plan:MCreatePlan)
    {
        guard
            
            let model:MCreate = self.model
        
        else
        {
            return
        }
        
        model.plan = plan
        model.changeMapStatus(
            statusType:MCreateMapStatusContracted.self)
        model.changeStatus(
            statusType:MCreateStatusReady.self)
    }
    
    //MARK: internal
    
    func nextStep(model:MCreate)
    {
        self.model = model
        startPlan()
    }
}
