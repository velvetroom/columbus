import UIKit

struct MMenuItemPlans:MMenuItemProtocol
{
    let order:MMenuOrder = MMenuOrder.plans
    let icon:UIImage = #imageLiteral(resourceName: "assetMenuPlans")
    let controllerType:UIViewController.Type = CPlans.self
}
