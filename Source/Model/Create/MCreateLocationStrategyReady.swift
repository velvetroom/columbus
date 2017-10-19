import Foundation

final class MCreateLocationStrategyReady:MCreateLocationStrategyProtocol
{
    private weak var model:MCreate?
    
    func nextStep(model:MCreate)
    {
        self.model = model
        startPlan()
    }
    
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
            
            let modelPlan:MCreatePlan = MCreatePlan(
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
}
