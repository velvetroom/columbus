import UIKit

struct MMenuItemHome:MMenuItemProtocol
{
    let order:MMenu.Order = MMenu.Order.home
    let icon:UIImage = UIImage()
    let controllerType:UIViewController.Type = CHome.self
}
