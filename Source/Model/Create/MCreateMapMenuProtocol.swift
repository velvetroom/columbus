import UIKit

protocol MCreateMapMenuProtocol
{
    var statusType:MCreateMapStatusProtocol.Type? { get }
    var icon:UIImage { get }
    var iconSelected:UIImage { get }
    
    func selected(controller:CCreate)
}
