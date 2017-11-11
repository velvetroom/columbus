import Foundation

extension MCreate
{
    //MARK: private
    
    private func loadSettings()
    {
        MCreate.factorySettings(bundle:nil)
        { [weak self] (database:Database, settings:DSettings) in
            
            self?.database = database
            self?.settings = settings
        }
    }
    
    private func loadedSettings(
        database:Database,
        settings:DSettings)
    {
        self.database = database
        self.settings = settings
        
        load()
    }
    
    //MARK: internal
    
    func load()
    {
        guard
        
            database == nil,
            settings == nil
        
        else
        {
            checkAuthorization()
            
            return
        }
        
        loadSettings()
    }
}
