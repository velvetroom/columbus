import Foundation
import StoreKit

final class MStoreKit:NSObject
{
    weak var model:MStore?
    weak var request:SKProductsRequest?

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
}
