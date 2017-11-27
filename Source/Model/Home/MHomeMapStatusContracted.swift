import UIKit

struct MHomeMapStatusContracted:MHomeMapStatusProtocol
{
    let menuItems:[MHomeMapMenuProtocol] = factoryMenuItems()
    let barBottom:CGFloat = -ViewMain.Constants.menuHeight
}
