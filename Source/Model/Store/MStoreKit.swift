import Foundation
import StoreKit

final class MStoreKit:
    NSObject,
    SKRequestDelegate,
    SKProductsRequestDelegate,
    SKPaymentTransactionObserver
{
    weak var model:MStore?

    //MARK: storekit
    
    func request(
        _ request:SKRequest,
        didFailWithError error:Error)
    {
        model?.error = error.localizedDescription
        model?.view?.refresh()
    }
    
    func paymentQueue(
        _ queue:SKPaymentQueue,
        updatedTransactions transactions:[SKPaymentTransaction])
    {
        
    }
    
    func productsRequest(
        _ request:SKProductsRequest,
        didReceive response:SKProductsResponse)
    {
        
    }
}
