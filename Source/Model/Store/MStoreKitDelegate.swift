import Foundation
import StoreKit

extension MStoreKit:
    SKRequestDelegate,
    SKProductsRequestDelegate,
    SKPaymentTransactionObserver
{
    //MARK: storekit
    
    func request(
        _ request:SKRequest,
        didFailWithError error:Error)
    {
        model?.statusError(error:error.localizedDescription)
    }
    
    func paymentQueue(
        _ queue:SKPaymentQueue,
        updatedTransactions transactions:[SKPaymentTransaction])
    {
        DispatchQueue.global(
            qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.model?.updateTransactions(
                transactions:transactions)
        }
    }
    
    func paymentQueue(
        _ queue:SKPaymentQueue,
        removedTransactions transactions:[SKPaymentTransaction])
    {
        DispatchQueue.global(
            qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.model?.updateTransactions(
                transactions:transactions)
        }
    }
    
    func productsRequest(
        _ request:SKProductsRequest,
        didReceive response:SKProductsResponse)
    {
        let products:[SKProduct] = response.products
        
        DispatchQueue.global(
            qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.model?.received(
                products:products)
        }
    }
}
