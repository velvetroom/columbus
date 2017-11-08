import Foundation

final class MSettings:Model<ArchSettings>
{
    private(set) var items:[MSettingsProtocol]
    private var database:Database?
    private var settings:DSettings?
    
    required init()
    {
        items = []
        
        super.init()
    }
    
    //MARK: private
    
    private func loadSettings(
        settings:DSettings,
        database:Database)
    {
        self.settings = settings
        items = MSettings.factoryItems(
            settings:settings,
            database:database)
        
        view?.settingsLoaded()
    }
    
    //MARK: internal
    
    func loadSettings()
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
            
            self?.loadSettings(
                settings:settings,
                database:database)
        }
    }
}
