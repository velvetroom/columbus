import UIKit

struct MCreateMapMenuExpand:MCreateMapMenuProtocol
{
    let statusType:MCreateMapStatusProtocol.Type = MCreateMapStatusExpanded.self
    let icon:UIImage = #imageLiteral(resourceName: "assetMapButton")
}
