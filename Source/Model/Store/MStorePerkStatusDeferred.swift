import Foundation
import StoreKit

struct MStorePerkStatusDeferred:
    MStorePerkStatusProtocol,
    MStorePerkStatusAvailableMessageProtocol
{
    let reusableIdentifier:String = VStoreStatusReadyListCellMessage.reusableIdentifier
    let product:SKProduct
    let price:String
    let message:String = String.localizedModel(key:"MStorePerkStatusDeferred_message")
}
