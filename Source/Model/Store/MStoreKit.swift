import Foundation
import StoreKit

final class MStoreKit:NSObject
{
    weak var model:MStore?
    private weak var request:SKProductsRequest?

    deinit
    {
        clean()
    }
    
    //MARK: internal
    
    func start()
    {
        SKPaymentQueue.default().add(self)
    }
    
    func clean()
    {
        SKPaymentQueue.default().remove(self)
        request?.cancel()
    }
    
    func checkAvailabilities(
        productIdentifiers:Set<String>)
    {
        let request:SKProductsRequest = SKProductsRequest(
            productIdentifiers:productIdentifiers)
        request.delegate = self
        self.request = request
        
        request.start()
    }
}
