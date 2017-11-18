import Foundation
import StoreKit

struct MStorePerkStatusDeferred:
    MStorePerkStatusProtocol,
    MStorePerkStatusAvailableMessageProtocol
{
    let reusableIdentifier:String = VStoreStatusReadyListCellDeferred.reusableIdentifier
    let product:SKProduct
    let price:String
}
