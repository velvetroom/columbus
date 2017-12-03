import Foundation

extension MSettingsDetailLevel
{
    //MARK: internal
    
    class func factoryItems() -> [MSettingsDetailLevelProtocol]
    {
        let itemMin:MSettingsDetailLevelMin = MSettingsDetailLevelMin()
        let itemMedium:MSettingsDetailLevelMedium = MSettingsDetailLevelMedium()
        let itemMax:MSettingsDetailLevelMax = MSettingsDetailLevelMax()
        
        let items:[MSettingsDetailLevelProtocol] = [
            itemMax,
            itemMedium,
            itemMin]
        
        return items
    }
    
    class func factoryIndexMap(items:[MSettingsDetailLevelProtocol]) -> [DSettingsDetailLevel:Int]
    {
        var index:Int = 0
        var map:[DSettingsDetailLevel:Int] = [:]
        
        for item:MSettingsDetailLevelProtocol in items
        {
            map[item.detailLevel] = index
            index += 1
        }
        
        return map
    }
}
