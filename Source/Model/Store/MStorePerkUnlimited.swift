import UIKit
import StoreKit

final class MStorePerkUnlimited:MStorePerkProtocol
{
    var status:MStorePerkStatusProtocol?
    let perkType:DPerkType = DPerkType.unlimited
    let identifier:String = "iturbide.columbus.unlimited"
    let icon:UIImage
    let title:String
    let descr:String
    
    init()
    {
        icon = #imageLiteral(resourceName: "assetStoreUnlimited")
        title = String.localizedModel(key:"MStorePerkUnlimited_title")
        descr = String.localizedModel(key:"MStorePerkUnlimited_descr")
    }
}
