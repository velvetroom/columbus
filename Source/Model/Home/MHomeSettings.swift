import Foundation

extension MHome
{
    //MARK: private
    
    private func loadSettings(
        database:Database)
    {
        database.fetch
        { [weak self] (settingsList:[DSettings]) in
            
            guard
            
                let settings:DSettings = settingsList.first
            
            else
            {
                self?.createSettings(
                    database:database)
                
                return
            }
            
            self?.settingsLoaded(
                settings:settings)
        }
    }
    
    private func createSettings(
        database:Database)
    {
        database.create
        { [weak self] (settings:DSettings) in
        
            self?.settingsCreated(
                database:database,
                settings:settings)
        }
    }
    
    private func settingsCreated(
        database:Database,
        settings:DSettings)
    {
        database.save
        { [weak self] in
            
            self?.settingsLoaded(
                settings:settings)
        }
    }
    
    //MARK: internal
    
    func loadSettings()
    {
        guard
        
            let database:Database = Database(
                bundle:nil)
        
        else
        {
            return
        }
        
        self.database = database
        
        loadSettings(database:database)
    }
}
