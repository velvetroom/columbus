import UIKit

struct MMenuItemCreate:MMenuItemProtocol
{
    let order:MMenu.Order = MMenu.Order.create
    let icon:UIImage = #imageLiteral(resourceName: "assetMenuCreate")
    let controllerType:UIViewController.Type = CCreate.self
}
