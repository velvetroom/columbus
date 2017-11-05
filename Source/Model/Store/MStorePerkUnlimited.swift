import UIKit
import StoreKit

struct MStorePerkUnlimited:MStorePerkProtocol
{
    var status:SKPaymentTransactionState?
    var price:String?
    let perkType:DPerkType = DPerkType.unlimited
    let purchaseId:String = "iturbide.columbus.unlimited"
    let icon:UIImage
    let title:String
    let descr:String
}
