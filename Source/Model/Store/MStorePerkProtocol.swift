import UIKit
import StoreKit

protocol MStorePerkProtocol
{
    var product:SKProduct? { get set }
    var status:SKPaymentTransactionState? { get set }
    var perkType:DPerkType { get }
    var icon:UIImage { get }
    var identifier:String { get }
    var title:String { get }
    var descr:String { get }
    var price:String? { get }
}
