import Foundation
import StoreKit

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
        var perkUnlimited:MStorePerkUnlimited = MStorePerkUnlimited()
        perkUnlimited.statusUnavailable()
        
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
            map[perk.identifier] = perk
        }
        
        return map
    }
    
    class func factoryTransactionMap() -> [
        SKPaymentTransactionState:
        TransactionRouter]
    {
        let map:[
            SKPaymentTransactionState:
            TransactionRouter] = [
                SKPaymentTransactionState.purchasing:
                transactionPurchasing]
        
        return map
    }
    
    func factoryProductIdentifiers() -> Set<String>
    {
        let perkKeys:Set<String> = Set<String>(perksMap.keys)
        
        return perkKeys
    }
}
