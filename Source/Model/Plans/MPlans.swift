import Foundation

final class MPlans:Model<ArchPlans>
{
    var database:Database?
    var settings:DSettings?
    var plans:[DPlan]?
    let kSortersKey:String = "created"
    
    //MARK: private
    
    private func activate(
        settings:DSettings,
        plan:DPlan)
    {
        guard
            
            settings.activePlan == plan
            
        else
        {
            settings.activePlan = plan
            
            return
        }
        
        settings.activePlan = nil
    }
    
    //MARK: internal
    
    func activate(plan:DPlan)
    {
        guard
        
            let settings:DSettings = self.settings
        
        else
        {
            return
        }
        
        activate(
            settings:settings,
            plan:plan)
    }
}
