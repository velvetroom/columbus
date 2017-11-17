import Foundation

extension MCreateTravel
{
    //MARK: internal
    
    class func factoryItems() -> [MCreateTravelProtocol]
    {
        let itemWalking:MCreateTravelWalking = MCreateTravelWalking()
        let itemCycling:MCreateTravelCycling = MCreateTravelCycling()
        let itemTransit:MCreateTravelTransit = MCreateTravelTransit()
        let itemDriving:MCreateTravelDriving = MCreateTravelDriving()
        
        let items:[MCreateTravelProtocol] = [
            itemWalking,
            itemCycling,
            itemTransit,
            itemDriving]
        
        return items
    }
    
    class func factoryIndexMap(items:[MCreateTravelProtocol]) -> [DPlanTravelMode:Int]
    {
        var index:Int = 0
        var map:[DPlanTravelMode:Int] = [:]
        
        for item:MCreateTravelProtocol in items
        {
            map[item.mode] = index
            index += 1
        }
        
        return map
    }
}
