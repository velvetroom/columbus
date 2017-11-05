import Foundation
import StoreKit

struct MStorePerkStatusPurchasing:MStorePerkStatusProtocol
{
    let reusableIdentifier:String = VStoreStatusReadyListCellUnavailable.reusableIdentifier
    let product:SKProduct
    let price:String
}
