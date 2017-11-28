import UIKit

struct MHomeMapStatusExpanded:MHomeMapStatusProtocol
{
    let menuItems:[MHomeMapMenuProtocol] = factoryMenuItems()
    let barBottom:CGFloat = VHomeReady.Constants.barHeight - ViewMain.Constants.menuHeight
}
