import Foundation
import StoreKit

struct MStorePerkStatusNew:
    MStorePerkStatusProtocol,
    MStorePerkStatusAvailableProtocol
{
    let reusableIdentifier:String = VStoreStatusReadyListCellNew.reusableIdentifier
    let product:SKProduct
    let price:String
}
