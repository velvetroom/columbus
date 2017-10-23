import Foundation

final class MSettings:Model<ArchSettings>
{
    private(set) var items:[MSettingsProtocol]
    private var database:Database?
    
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
        { [weak self] (settingsList:[DSettings]) in
            
            guard
            
                let settings:DSettings = settingsList.first
            
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
