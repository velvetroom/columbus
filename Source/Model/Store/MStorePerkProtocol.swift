import UIKit
import StoreKit

protocol MStorePerkProtocol
{
    var perkType:DPerkType { get }
    var status:SKPaymentTransactionState { get }
    var icon:UIImage { get }
    var title:String { get }
    var descr:String { get }
}
