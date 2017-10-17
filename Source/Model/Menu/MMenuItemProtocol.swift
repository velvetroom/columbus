import UIKit

protocol MMenuItemProtocol
{
    var order:MMenu.Order { get }
    var icon:UIImage { get }
    var controllerType:UIViewController.Type { get }
}
