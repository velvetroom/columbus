import Foundation

extension MHome
{
    //MARK: private
    
    private func configureSettings(settings:DSettings)
    {
        guard
            
            let plan:DPlan = settings.activePlan
        
        else
        {
            configureNoPlan()
            
            return
        }
        
        configurePlan(plan:plan)
    }
    
    private func configureNoPlan()
    {
        let statusType:MHomeStatusStandby.Type = MHomeStatusStandby.self
        changeStatus(statusType:statusType)
    }
    
    private func configurePlan(plan:DPlan)
    {
        guard
            
            let tileTemplate:String = MHome.factoryTileTemplate(plan:plan)
        
        else
        {
            return
        }
        
        let modelPlan:MHomePlan = MHomePlan(
            plan:plan,
            tileTemplate:tileTemplate)
        
        configurePlan(plan:modelPlan)
    }
    
    private func configurePlan(plan:MHomePlan)
    {
        self.plan = plan
        
        let statusType:MHomeStatusReady.Type = MHomeStatusReady.self
        changeMapStatus(statusType:MHomeMapStatusContracted.self)
        changeStatus(statusType:statusType)
        
        let deadline:DispatchTime = DispatchTime.now() + MHome.Constants.TimeIntervals.waitAddNavigation
        DispatchQueue.main.asyncAfter(deadline:deadline)
        { [weak self] in
            
            self?.addNavigation(plan:plan)
        }
    }
    
    private func addNavigation(plan:MHomePlan)
    {
        guard
        
            let view:VHomeReady = self.view?.view as? VHomeReady
        
        else
        {
            return
        }
        
        plan.addMapNavigation(view:view)
    }
    
    private func updateController()
    {
        guard
            
            let controller:CHome = view?.controller as? CHome
            
        else
        {
            return
        }
        
        controller.settingsLoaded()
    }
    
    //MARK: internal
    
    func settingsLoaded(settings:DSettings)
    {
        self.settings = settings
        configureSettings(settings:settings)
        updateController()
    }
}
