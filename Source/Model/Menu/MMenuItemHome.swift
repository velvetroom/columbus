import UIKit

struct MMenuItemHome:MMenuItemProtocol
{
    let order:MMenuOrder = MMenuOrder.home
    let icon:UIImage = #imageLiteral(resourceName: "assetMenuHome")
    let controllerType:UIViewController.Type = CHome.self
}
