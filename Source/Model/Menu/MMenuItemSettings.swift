import UIKit

struct MMenuItemSettings:MMenuItemProtocol
{
    let order:MMenu.Order = MMenu.Order.settings
    let icon:UIImage = #imageLiteral(resourceName: "assetMenuSettings")
    let controllerType:UIViewController.Type = CSettings.self
}
