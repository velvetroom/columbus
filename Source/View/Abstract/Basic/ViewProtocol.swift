import UIKit

protocol ViewProtocol:class
{
    weak var layoutLeft:NSLayoutConstraint! { get set }
    weak var layoutRight:NSLayoutConstraint! { get set }
    weak var layoutTop:NSLayoutConstraint! { get set }
    weak var layoutBottom:NSLayoutConstraint! { get set }
    weak var pushBackground:VPushBackground? { get set }
    var panBack:Bool { get }
}
