import Foundation
import StoreKit

extension MStoreKit
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
        
    }
    
    func productsRequest(
        _ request:SKProductsRequest,
        didReceive response:SKProductsResponse)
    {
    }
}
