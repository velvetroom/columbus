import UIKit

struct MMenuItemStore:MMenuItemProtocol
{
    let order:MMenuOrder = MMenuOrder.store
    let icon:UIImage = #imageLiteral(resourceName: "assetMenuStore")
    let controllerType:UIViewController.Type = CStore.self
}
