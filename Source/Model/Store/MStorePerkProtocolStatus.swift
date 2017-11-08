import Foundation
import StoreKit

extension MStorePerkProtocol
{
    //MARK: internal
    
    mutating func statusUnavailable()
    {
        status = MStorePerkStatusUnavailable()
    }
    
    mutating func statusPurchasing(
        product:SKProduct,
        price:String)
    {
        status = MStorePerkStatusPurchasing(
            product:product,
            price:price)
    }
    
    mutating func statusPurchased(
        product:SKProduct,
        price:String)
    {
        status = MStorePerkStatusPurchased(
            product:product,
            price:price)
    }
    
    mutating func statusDeferred(
        product:SKProduct,
        price:String)
    {
        status = MStorePerkStatusDeferred(
            product:product,
            price:price)
    }
    
    mutating func statusNew(
        product:SKProduct,
        price:String)
    {
        status = MStorePerkStatusNew(
            product:product,
            price:price)
    }
}
