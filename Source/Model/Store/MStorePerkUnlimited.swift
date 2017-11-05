import UIKit
import StoreKit

final class MStorePerkUnlimited:MStorePerkProtocol
{
    var product:SKProduct?
    var status:SKPaymentTransactionState?
    var price:String?
    let perkType:DPerkType = DPerkType.unlimited
    let identifier:String = "iturbide.columbus.unlimited"
    let icon:UIImage = #imageLiteral(resourceName: "assetStoreUnlimited")
    let title:String = String.localizedModel(key:"MStorePerkUnlimited_title")
    let descr:String = String.localizedModel(key:"MStorePerkUnlimited_descr")
}
