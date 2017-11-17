import Foundation

extension MStore
{
    //MARK: private
    
    private func asyncLoad()
    {
        changeStatus(statusType:MStoreStatusLoading.self)
        
        guard
        
            let database:Database = Database(
                bundle:nil)
        
        else
        {
            return
        }
        
        database.fetch
        { [weak self] (settings:[DSettings]) in
            
            guard
            
                let settings:DSettings = settings.first
            
            else
            {
                return
            }
            
            self?.settingsLoaded(
                database:database,
                settings:settings)
        }
    }
    
    private func settingsLoaded(
        database:Database,
        settings:DSettings)
    {
        self.database = database
        self.settings = settings
        
        let productIdentifiers:Set<String> = factoryProductIdentifiers()
        modelKit.checkAvailabilities(productIdentifiers:productIdentifiers)
    }
    
    //MARK: internal
    
    func load()
    {
        modelKit.start()
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncLoad()
        }
    }
}
