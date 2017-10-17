import UIKit

protocol MMenuItemProtocol
{
    var order:MMenuOrder { get }
    var icon:UIImage { get }
    var controllerType:UIViewController.Type { get }
}
