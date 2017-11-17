import UIKit

struct MMenuItemPlans:MMenuItemProtocol
{
    let order:MMenu.Order = MMenu.Order.plans
    let icon:UIImage = #imageLiteral(resourceName: "assetMenuPlans")
    let controllerType:UIViewController.Type = CPlans.self
}
