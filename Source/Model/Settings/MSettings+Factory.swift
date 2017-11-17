import Foundation

extension MSettings
{
    //MARK: private
    
    private class func factoryItemTypes() -> [MSettingsProtocol.Type]
    {
        let types:[MSettingsProtocol.Type] = [
            MSettingsStorage.self,
            MSettingsTravelMode.self,
            MSettingsDetailLevel.self,
            MSettingsDistance.self]
        
        return types
    }
    
    //MARK: internal
    
    class func factoryItems(
        settings:DSettings,
        database:Database) -> [MSettingsProtocol]
    {
        let itemTypes:[MSettingsProtocol.Type] = factoryItemTypes()
        var items:[MSettingsProtocol] = []
        
        for itemType:MSettingsProtocol.Type in itemTypes
        {
            let item:MSettingsProtocol = itemType.init(
                settings:settings,
                database:database)
            
            items.append(item)
        }
        
        return items
    }
}
