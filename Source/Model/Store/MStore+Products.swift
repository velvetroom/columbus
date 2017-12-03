import Foundation
import StoreKit

extension MStore
{
    //MARK: private
    
    private func received(product:SKProduct)
    {
        let identifier:String = product.productIdentifier
        
        guard
            
            let perk:MStorePerkProtocol = perksMap[identifier],
            let price:String = factoryPrice(product:product)
            
        else
        {
            return
        }
        
        received(
            product:product,
            perk:perk,
            price:price)
    }
    
    private func received(
        product:SKProduct,
        perk:MStorePerkProtocol,
        price:String)
    {
        var perk:MStorePerkProtocol = perk
        
        guard
        
            let _:DPerk = settings?.perksMap[perk.perkType]
        
        else
        {
            perk.statusNew(
                product:product,
                price:price)
            
            return
        }
        
        perk.statusPurchased(
            product:product,
            price:price)
    }
    
    private func factoryPrice(product:SKProduct) -> String?
    {
        priceFormatter.locale = product.priceLocale
        let priceNumber:NSDecimalNumber = product.price
        let price:String? = priceFormatter.string(from:priceNumber)
        
        return price
    }
    
    //MARK: internal
    
    func received(products:[SKProduct])
    {
        for product:SKProduct in products
        {
            received(product:product)
        }
        
        changeStatus(statusType:MStoreStatusReady.self)
    }
}
