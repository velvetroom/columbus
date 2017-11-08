import UIKit

protocol MStorePerkProtocol
{
    var status:MStorePerkStatusProtocol? { get set }
    var perkType:DPerkType { get }
    var icon:UIImage { get }
    var identifier:String { get }
    var title:String { get }
    var descr:String { get }
}
