import UIKit

struct MMenuItemSettings:MMenuItemProtocol
{
    let order:MMenuOrder = MMenuOrder.settings
    let icon:UIImage = #imageLiteral(resourceName: "assetMenuSettings")
    let controllerType:UIViewController.Type = CSettings.self
}
