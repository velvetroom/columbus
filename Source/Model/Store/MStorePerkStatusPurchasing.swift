import Foundation
import StoreKit

struct MStorePerkStatusPurchasing:
    MStorePerkStatusProtocol,
    MStorePerkStatusAvailableProtocol
{
    let reusableIdentifier:String = VStoreStatusReadyListCellPurchasing.reusableIdentifier
    let product:SKProduct
    let price:String
}