import Foundation

extension MSettingsDistance
{
    //MARK: internal
    
    class func factoryItems() -> [MSettingsDistanceProtocol]
    {
        let itemKilometers:MSettingsTravelModeDriving = MSettingsTravelModeDriving()
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
    
    class func factoryIndexMap(
        items:[MSettingsTravelModeProtocol]) -> [DPlanTravelMode:Int]
    {
        var index:Int = 0
        var map:[DPlanTravelMode:Int] = [:]
        
        for item:MSettingsTravelModeProtocol in items
        {
            map[item.mode] = index
            index += 1
        }
        
        return map
    }
}
