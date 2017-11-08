import Foundation
import StoreKit

struct MStorePerkStatusPurchased:
    MStorePerkStatusProtocol,
    MStorePerkStatusAvailableProtocol
{
    let reusableIdentifier:String = VStoreStatusReadyListCellPurchased.reusableIdentifier
    let product:SKProduct
    let price:String
}
