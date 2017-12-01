import UIKit

struct MPlansDetailItemStop:MPlansDetailItemProtocol
{
    let icon:UIImage
    let reusableIdentifier:String = VHomeReadyBarListCellStop.reusableIdentifier
    let cellHeight:CGFloat = 60
    let title:String
}
