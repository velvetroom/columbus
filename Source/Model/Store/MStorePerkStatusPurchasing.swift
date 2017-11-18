import Foundation
import StoreKit

struct MStorePerkStatusPurchasing:
    MStorePerkStatusProtocol,
    MStorePerkStatusAvailableMessageProtocol
{
    let reusableIdentifier:String = VStoreStatusReadyListCellPurchasing.reusableIdentifier
    let product:SKProduct
    let price:String
}
