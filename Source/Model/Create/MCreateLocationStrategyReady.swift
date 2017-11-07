import Foundation

final class MCreateLocationStrategyReady:MCreateLocationStrategyProtocol
{
    private weak var model:MCreate?
    
    //MARK: private
    
    private func validateAvailablity(
        database:Database,
        settings:DSettings)
    {
        guard
        
            let _:DPerk = settings.perksMap[DPerkType.unlimited]
        
        else
        {
            notUnlimited(database:database)
            
            return
        }
        
        startPlan(database:database)
    }
    
    private func notUnlimited(
        database:Database)
    {
        database.fetch
        { [weak self] (plan:[DPlan]) in
            <#code#>
        }
    }
    
    private func startPlan(database:Database)
    {
        database.create
        { [weak self] (plan:DPlan) in
            
            guard
                
                let model:MCreate = self?.model
            
            else
            {
                return
            }
            
            let modelPlan:MCreatePlan = MCreatePlan(
                model:model,
                plan:plan)
            
            self?.planReady(plan:modelPlan)
        }
    }
    
    private func availabilityError()
    {
        
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
        
        guard
            
            let database:Database = model.database,
            let settings:DSettings = model.settings
            
        else
        {
            databaseError()
            
            return
        }
        
        validateAvailablity(
            database:database,
            settings:settings)
    }
}
