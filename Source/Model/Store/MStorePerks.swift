import Foundation
import StoreKit

extension MStore
{
    //MARK: private
    
    private func received(product:SKProduct)
    {
        let identifier:String = product.productIdentifier
        
        guard
            
            var perk:MStorePerkProtocol = perksMap[identifier],
            let price:String = factoryPrice(product:product)
            
        else
        {
            return
        }
        
        perk.product = product
        perk.price = price
    }
    
    private func factoryPrice(product:SKProduct) -> String?
    {
        priceFormatter.locale = product.priceLocale
        let priceNumber:NSDecimalNumber = product.price
        let price:String? = priceFormatter.string(
            from:priceNumber)
        
        return price
    }
    
    //MARK: internal
    
    func received(products:[SKProduct])
    {
        for product:SKProduct in products
        {
            received(product:product)
        }
    }
}
