import Foundation

extension MPlans
{
    //MARK: private
    
    private func asyncLoad()
    {
        guard
        
            let database:Database = Database(bundle:nil)
        
        else
        {
            return
        }
        
        self.database = database
        
        database.fetch
        { [weak self] (settings:[DSettings]) in
            
            guard
            
                let settings:DSettings = settings.first
            
            else
            {
                return
            }
            
            self?.settingsLoaded(
                settings:settings)
        }
    }
    
    private func settingsLoaded(
        settings:DSettings)
    {
        self.settings = settings
        
        database?.fetch
        { [weak self] (plans:[DPlan]) in
            
            self?.plansLoaded(
                plans:plans)
        }
    }
    
    private func plansLoaded(
        plans:[DPlan])
    {
        self.plans = plans
        view?.plansLoaded()
    }
    
    //MARK: internal
    
    func load()
    {
        DispatchQueue.global(
            qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncLoad()
        }
    }
}
