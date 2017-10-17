import UIKit

struct MMenuItemCreate:MMenuItemProtocol
{
    let order:MMenuOrder = MMenuOrder.create
    let icon:UIImage = #imageLiteral(resourceName: "assetMenuCreate")
    let controllerType:UIViewController.Type = CCreate.self
}
