import UIKit

struct MHomePlanItemStop:MHomePlanItemProtocol
{
    private(set) weak var stop:DPlanStop!
    let icon:UIImage
    let reusableIdentifier:String = VHomeReadyBarListCellStop.reusableIdentifier
    let cellHeight:CGFloat = 60
    let title:String
}
