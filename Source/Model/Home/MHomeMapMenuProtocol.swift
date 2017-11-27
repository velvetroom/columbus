import UIKit

protocol MHomeMapMenuProtocol
{
    var statusType:MHomeMapStatusProtocol.Type? { get }
    var icon:UIImage { get }
    var iconSelected:UIImage { get }
    
    func selected(controller:CHome)
}
