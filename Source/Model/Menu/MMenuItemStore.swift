import UIKit

struct MMenuItemStore:MMenuItemProtocol
{
    let order:MMenu.Order = MMenu.Order.store
    let icon:UIImage = #imageLiteral(resourceName: "assetMenuStore")
    let controllerType:UIViewController.Type = CStore.self
}
