import Foundation
import StoreKit

extension MStoreKit
{
    //MARK: private
    
    private func asyncRestorePurchases()
    {
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
    
    private func asyncCheckAvailabilities(
        productIdentifiers:Set<String>)
    {
        self.request?.cancel()
        
        let request:SKProductsRequest = SKProductsRequest(
            productIdentifiers:productIdentifiers)
        request.delegate = self
        self.request = request
        
        request.start()
    }
    
    private func asyncPurchase(
        perk:MStorePerkProtocol)
    {
        
    }
    
    //MARK: internal
    
    func checkAvailabilities(
        productIdentifiers:Set<String>)
    {
        DispatchQueue.global(
            qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
        
            self?.asyncCheckAvailabilities(
                productIdentifiers:productIdentifiers)
        }
    }
    
    func restorePurchases()
    {
        DispatchQueue.global(
            qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncRestorePurchases()
        }
    }
    
    func purchase(perk:MStorePerkProtocol)
    {
        DispatchQueue.global(
            qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncPurchase(perk:perk)
        }
    }
}
