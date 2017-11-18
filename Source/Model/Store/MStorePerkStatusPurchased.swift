import Foundation
import StoreKit

struct MStorePerkStatusPurchased:
    MStorePerkStatusProtocol,
    MStorePerkStatusAvailableMessageProtocol
{
    let reusableIdentifier:String = VStoreStatusReadyListCellPurchased.reusableIdentifier
    let product:SKProduct
    let price:String
}
