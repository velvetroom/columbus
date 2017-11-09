import Foundation

extension MCreate
{
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
        { (settingsList:[DSettings]) in
            
            guard
                
                let settings:DSettings = settingsList.first
                
            else
            {
                return
            }
            
            completion(database, settings)
        }
    }
}
