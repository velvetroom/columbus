import Foundation

extension MCreate
{
    //MARK: private
    
    private func createSettings(
        database:Database,
        completion:@escaping((Database, DSettings) -> ()))
    {
        database.create
        { [weak self] (settings:DSettings) in
            
            self?.settingsCreated(
                settings:settings,
                database:database,
                completion:completion)
        }
    }
    
    private func settingsCreated(
        settings:DSettings,
        database:Database,
        completion:@escaping((Database, DSettings) -> ()))
    {
        database.save
        {
            completion(database, settings)
        }
    }
    
    //MARK: internal
    
    func factorySettings(
        bundle:Bundle?,
        completion:@escaping((Database, DSettings) -> ()))
    {
        guard
        
            let database:Database = Database(
                bundle:bundle)
        
        else
        {
            return
        }
        
        database.fetch
        { [weak self] (settingsList:[DSettings]) in
            
            guard
                
                let settings:DSettings = settingsList.first
                
            else
            {
                self?.createSettings(
                    database:database,
                    completion:completion)
                
                return
            }
            
            completion(database, settings)
        }
    }
}
