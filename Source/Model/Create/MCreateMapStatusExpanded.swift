import UIKit

struct MCreateMapStatusExpanded:MCreateMapStatusProtocol
{
    let menuItems:[MCreateMapMenuProtocol] = factoryMenuItems()
    let barTop:CGFloat = 0
}
