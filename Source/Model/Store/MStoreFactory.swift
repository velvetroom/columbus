import Foundation

extension MStore
{
    //MARK: internal
    
    class func factoryPriceFormatter() -> NumberFormatter
    {
        let formatter:NumberFormatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.currencyISOCode
        
        return formatter
    }
    
    class func factoryPerks() -> [MStorePerkProtocol]
    {
        let perkUnlimited:MStorePerkUnlimited = MStorePerkUnlimited()
        
        let perks:[MStorePerkProtocol] = [
            perkUnlimited]
        
        return perks
    }
    
    class func factoryPerksMap(
        perks:[MStorePerkProtocol]) -> [String:MStorePerkProtocol]
    {
        var map:[String:MStorePerkProtocol] = [:]
        
        for perk:MStorePerkProtocol in perks
        {
            map[perk.purchaseId] = perk
        }
        
        return map
    }
}
