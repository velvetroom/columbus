import Foundation

final class MCreateLocationStrategyReady:MCreateLocationStrategyProtocol
{
    private weak var model:MCreate?
    private let kMaxPlansAllowed:Int = 1
    
    //MARK: private
    
    private func validateAvailablity(
        database:Database,
        settings:DSettings)
    {
        guard
            
            settings.perksMap[DPerkType.unlimited] == nil
            
        else
        {
            startPlan(database:database)
            
            return
        }
        
        notUnlimited(database:database)
    }
    
    private func notUnlimited(
        database:Database)
    {
        let maxPlans:Int = kMaxPlansAllowed
        
        database.fetch
        { [weak self] (plans:[DPlan]) in
            
            let countPlans:Int = plans.count
            
            guard
            
                countPlans < maxPlans
            
            else
            {
                self?.availabilityError()
                
                return
            }
            
            self?.startPlan(database:database)
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
        model?.changeStatus(
            statusType:MCreateStatusErrorAvailability.self)
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
