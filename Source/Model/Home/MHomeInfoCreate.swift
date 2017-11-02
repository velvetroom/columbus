import UIKit

struct MHomeInfoCreate:MHomeInfoProtocol
{
    let icon:UIImage = #imageLiteral(resourceName: "assetMenuCreate")
    let title:String = String.localizedModel(
        key:"MHomeInfoCreate_title")
    let descr:String = String.localizedModel(
        key:"MHomeInfoCreate_descr")
}
