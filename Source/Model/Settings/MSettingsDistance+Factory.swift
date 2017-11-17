import Foundation

extension MSettingsDistance
{
    //MARK: internal
    
    class func factoryItems() -> [MSettingsDistanceProtocol]
    {
        let itemKilometres:MSettingsDistanceKilometres = MSettingsDistanceKilometres()
        let itemMiles:MSettingsDistanceMiles = MSettingsDistanceMiles()
        
        let items:[MSettingsDistanceProtocol] = [
            itemKilometres,
            itemMiles]
        
        return items
    }
    
    class func factoryIndexMap(items:[MSettingsDistanceProtocol]) -> [DSettingsDistance:Int]
    {
        var index:Int = 0
        var map:[DSettingsDistance:Int] = [:]
        
        for item:MSettingsDistanceProtocol in items
        {
            map[item.distance] = index
            index += 1
        }
        
        return map
    }
}
