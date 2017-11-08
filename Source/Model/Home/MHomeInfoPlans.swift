import UIKit

struct MHomeInfoPlans:MHomeInfoProtocol
{
    let icon:UIImage = #imageLiteral(resourceName: "assetMenuPlans")
    let title:String = String.localizedModel(
        key:"MHomeInfoPlans_title")
    let descr:String = String.localizedModel(
        key:"MHomeInfoPlans_descr")
}
