import Foundation
import StoreKit

extension MStore
{
    //MARK: private
    
    private func received(product:SKProduct)
    {
        let identifier:String = product.productIdentifier
        
        guard
            
            let perk:MStorePerkProtocol = perksMap[identifier]
            
        else
        {
            return
        }
        
        perk.sk
        mappedItem.skProduct = skProduct
        priceFormatter.locale = skProduct.priceLocale
        
        let priceNumber:NSDecimalNumber = skProduct.price
        
        guard
            
            let priceString:String = priceFormatter.string(from:priceNumber)
            
            else
        {
            return
        }
        
        mappedItem.foundPurchase(price:priceString)
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
