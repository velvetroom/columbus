import UIKit

final class MHomeMapMenuExpand:MHomeMapMenuProtocol
{
    let statusType:MHomeMapStatusProtocol.Type? = MHomeMapStatusExpanded.self
    let icon:UIImage = #imageLiteral(resourceName: "assetMapButtonExpand")
    let iconSelected:UIImage = #imageLiteral(resourceName: "assetMapButtonExpandSelected")
}
