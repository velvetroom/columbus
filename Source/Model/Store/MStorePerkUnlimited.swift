import UIKit
import StoreKit

final class MStorePerkUnlimited:MStorePerkProtocol
{
    let perkType:DPerkType = DPerkType.unlimited
    let identifier:String = "iturbide.columbus.unlimited"
    let icon:UIImage = #imageLiteral(resourceName: "assetStoreUnlimited")
    let title:String = String.localizedModel(key:"MStorePerkUnlimited_title")
    let descr:String = String.localizedModel(key:"MStorePerkUnlimited_descr")
}
