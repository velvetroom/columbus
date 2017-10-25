import Foundation

extension MCreate
{
    //MARK: internal
    
    func factorySettings()
    {
        guard
        
            let database:Database = Database(
                bundle:nil)
        
        else
        {
            return
        }
        
        self.database = database
        
        database.fetch
        { [weak self] (settingsList:[DSettings]) in
            
            guard
                
                let settings:DSettings = settingsList.first
                
            else
            {
                return
            }
            
            self?.settings = settings
        }
    }
}
