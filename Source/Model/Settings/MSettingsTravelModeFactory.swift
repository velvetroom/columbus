import Foundation

extension MSettingsTravelMode
{
    //MARK: internal
    
    class func factoryItems() -> [MSettingsTravelModeProtocol]
    {
        let itemDriving:MSettingsTravelModeDriving = MSettingsTravelModeDriving()
        let itemCycling:MSettingsTravelModeCycling = MSettingsTravelModeCycling()
        let itemTransit:MSettingsTravelModeTransit = MSettingsTravelModeTransit()
        let itemWalking:MSettingsTravelModeWalking = MSettingsTravelModeWalking()
        
        let items:[MSettingsTravelModeProtocol] = [
            itemWalking,
            itemCycling,
            itemTransit,
            itemDriving]
        
        return items
    }
}
