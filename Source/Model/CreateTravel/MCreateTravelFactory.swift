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
}
