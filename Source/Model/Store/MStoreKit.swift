import Foundation
import StoreKit

final class MStoreKit:
    NSObject,
    SKRequestDelegate,
    SKProductsRequestDelegate,
    SKPaymentTransactionObserver
{
    weak var model:MStore?

}
