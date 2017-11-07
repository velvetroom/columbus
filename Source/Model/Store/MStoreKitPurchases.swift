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
        product:SKProduct)
    {
        let payment:SKPayment = SKPayment(
            product:product)
        SKPaymentQueue.default().add(payment)
    }
    
    private func asyncFinishTransaction(
        transaction:SKPaymentTransaction)
    {
        SKPaymentQueue.default().finishTransaction(transaction)
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
    
    func purchase(product:SKProduct)
    {
        DispatchQueue.global(
            qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncPurchase(product:product)
        }
    }
    
    func finishTransaction(
        transaction:SKPaymentTransaction)
    {
        DispatchQueue.global(
            qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncFinishTransaction(
                transaction:transaction)
        }
    }
}
