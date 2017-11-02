import UIKit

struct MHomeInfoSettings:MHomeInfoProtocol
{
    let icon:UIImage = #imageLiteral(resourceName: "assetMenuSettings")
    let title:String = String.localizedModel(
        key:"MHomeInfoSettings_title")
    let descr:String = String.localizedModel(
        key:"MHomeInfoSettings_descr")
}
