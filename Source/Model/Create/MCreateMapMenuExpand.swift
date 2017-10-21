import UIKit

final class MCreateMapMenuExpand:MCreateMapMenuProtocol
{
    let statusType:MCreateMapStatusProtocol.Type? = MCreateMapStatusExpanded.self
    let icon:UIImage = #imageLiteral(resourceName: "assetMapButtonExpand")
    let iconSelected:UIImage = #imageLiteral(resourceName: "assetMapButtonExpandSelected")
}
