import UIKit

struct MHomeInfoHome:MHomeInfoProtocol
{
    let icon:UIImage = #imageLiteral(resourceName: "assetMenuHome")
    let title:String = String.localizedModel(
        key:"MHomeInfoHome_title")
    let descr:String = String.localizedModel(
        key:"MHomeInfoHome_descr")
}
