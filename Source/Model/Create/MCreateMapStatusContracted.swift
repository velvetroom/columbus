import UIKit

struct MCreateMapStatusContracted:MCreateMapStatusProtocol
{
    let menuItems:[MCreateMapMenuProtocol] = factoryMenuItems()
    let barTop:CGFloat = 0
}
