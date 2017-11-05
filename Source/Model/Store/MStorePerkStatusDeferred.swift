import Foundation
import StoreKit

struct MStorePerkStatusDeferred:
    MStorePerkStatusProtocol,
    MStorePerkStatusAvailableProtocol
{
    let reusableIdentifier:String = VStoreStatusReadyListCellDeferred.reusableIdentifier
    let product:SKProduct
    let price:String
}
