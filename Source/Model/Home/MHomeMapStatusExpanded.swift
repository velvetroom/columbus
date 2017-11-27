import UIKit

struct MHomeMapStatusExpanded:MHomeMapStatusProtocol
{
    let menuItems:[MHomeMapMenuProtocol] = factoryMenuItems()
    let barBottom:CGFloat = 0
}
