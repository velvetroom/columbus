import Foundation
import StoreKit

final class MStoreKit:
    NSObject,
    SKRequestDelegate,
    SKProductsRequestDelegate,
    SKPaymentTransactionObserver
{
    private weak var model:MStore?
    
    init(model:MStore)
    {
        super.init()
        self.model = model
    }
    
    //MARK: storekit
    
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
