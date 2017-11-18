import Foundation
import StoreKit

struct MStorePerkStatusPurchased:
    MStorePerkStatusProtocol,
    MStorePerkStatusAvailableMessageProtocol
{
    let reusableIdentifier:String = VStoreStatusReadyListCellMessage.reusableIdentifier
    let product:SKProduct
    let price:String
    let message:String = String.localizedModel(key:"MStorePerkStatusPurchased_message")
}
