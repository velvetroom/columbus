import Foundation
import StoreKit

extension MStore
{
    //MARK: internal
    
    func transactionDeferred(
        perk:MStorePerkProtocol,
        transaction:SKPaymentTransaction)
    {
        var perk:MStorePerkProtocol = perk
        
        guard
        
            let status:MStorePerkStatusAvailableProtocol = perk.status as? MStorePerkStatusAvailableProtocol
        
        else
        {
            return
        }
        
        perk.statusDeferred(
            product:status.product,
            price:status.price)
    }
    
    func transactionFailed(
        perk:MStorePerkProtocol,
        transaction:SKPaymentTransaction)
    {
        var perk:MStorePerkProtocol = perk
        
        guard
            
            let status:MStorePerkStatusAvailableProtocol = perk.status as? MStorePerkStatusAvailableProtocol
            
        else
        {
            return
        }
        
        perk.statusNew(
            product:status.product,
            price:status.price)
        modelKit.finishTransaction(
            transaction:transaction)
    }
    
    func transactionPurchased(
        perk:MStorePerkProtocol,
        transaction:SKPaymentTransaction)
    {
        var perk:MStorePerkProtocol = perk
        
        guard
            
            let status:MStorePerkStatusAvailableProtocol = perk.status as? MStorePerkStatusAvailableProtocol
            
        else
        {
            return
        }
        
        perk.statusPurchased(
            product:status.product,
            price:status.price)
        modelKit.finishTransaction(
            transaction:transaction)
    }
    
    func transactionPurchasing(
        perk:MStorePerkProtocol,
        transaction:SKPaymentTransaction)
    {
        var perk:MStorePerkProtocol = perk
        
        guard
            
            let status:MStorePerkStatusAvailableProtocol = perk.status as? MStorePerkStatusAvailableProtocol
            
        else
        {
            return
        }
        
        perk.statusPurchasing(
            product:status.product,
            price:status.price)
    }
}
