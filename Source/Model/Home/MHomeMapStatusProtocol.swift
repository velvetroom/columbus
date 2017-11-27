import UIKit

protocol MHomeMapStatusProtocol
{
    var menuItems:[MHomeMapMenuProtocol] { get }
    var barBottom:CGFloat { get }
    
    init()
}
