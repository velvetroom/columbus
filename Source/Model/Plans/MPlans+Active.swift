import Foundation

extension MPlans
{
    //MARK: private
    
    private func activate(
        settings:DSettings,
        plan:DPlan)
    {
        guard
            
            settings.activePlan === plan
            
        else
        {
            saveActivePlan(
                settings:settings,
                plan:plan)
            
            return
        }
        
        saveActivePlan(
            settings:settings,
            plan:nil)
    }
    
    private func saveActivePlan(
        settings:DSettings,
        plan:DPlan?)
    {
        settings.activePlan = plan
        
        database?.save
        { [weak self] in
            
            self?.view?.plansLoaded()
        }
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
