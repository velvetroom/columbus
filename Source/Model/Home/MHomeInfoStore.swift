import UIKit

struct MHomeInfoStore:MHomeInfoProtocol
{
    let icon:UIImage = #imageLiteral(resourceName: "assetMenuStore")
    let title:String = String.localizedModel(key:"MHomeInfoStore_title")
    let descr:String = String.localizedModel(key:"MHomeInfoStore_descr")
}
