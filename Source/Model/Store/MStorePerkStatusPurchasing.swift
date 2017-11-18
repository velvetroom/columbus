import Foundation
import StoreKit

struct MStorePerkStatusPurchasing:
    MStorePerkStatusProtocol,
    MStorePerkStatusAvailableMessageProtocol
{
    let reusableIdentifier:String = VStoreStatusReadyListCellMessage.reusableIdentifier
    let product:SKProduct
    let price:String
    let message:String = String.localizedModel(key:"MStorePerkStatusPurchasing_message")
}
