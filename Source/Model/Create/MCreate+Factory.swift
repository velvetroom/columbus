import Foundation

extension MCreate
{
    //MARK: private
    
    private class func createSettings(
        database:Database,
        completion:@escaping((Database, DSettings) -> ()))
    {
        database.create
        { (settings:DSettings) in
            
            settingsCreated(
                settings:settings,
                database:database,
                completion:completion)
        }
    }
    
    private class func settingsCreated(
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
    
    class func factorySettings(
        bundle:Bundle?,
        completion:@escaping((Database, DSettings) -> ()))
    {
        guard
        
            let database:Database = Database(bundle:bundle)
        
        else
        {
            return
        }
        
        database.fetch
        { (settingsList:[DSettings]) in
            
            guard
                
                let settings:DSettings = settingsList.first
                
            else
            {
                createSettings(
                    database:database,
                    completion:completion)
                
                return
            }
            
            completion(database, settings)
        }
    }
}
