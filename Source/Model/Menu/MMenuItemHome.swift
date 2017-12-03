import UIKit

struct MMenuItemHome:MMenuItemProtocol
{
    let order:MMenu.Order = MMenu.Order.home
    let icon:UIImage = #imageLiteral(resourceName: "assetMenuHome")
    let controllerType:UIViewController.Type = CHome.self
}
