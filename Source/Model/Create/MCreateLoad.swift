import Foundation

extension MCreate
{
    //MARK: private
    
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
        
        loadSettings(bundle:nil)
    }
    
    func loadSettings(bundle:Bundle?)
    {
        MCreate.factorySettings(bundle:bundle)
        { [weak self] (database:Database, settings:DSettings) in
            
            self?.loadedSettings(
                database:database,
                settings:settings)
        }
    }
}
