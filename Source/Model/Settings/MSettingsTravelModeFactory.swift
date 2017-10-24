import Foundation

extension MSettingsTravelMode
{
    //MARK: internal
    
    class func factoryItems() -> [MSettingsTravelModeProtocol]
    {
        let itemDriving:MSettingsTravelModeDriving = MSettingsTravelModeDriving()
        
        let items:[MSettingsTravelModeProtocol] = [
            itemDriving]
        
        return items
    }
}
