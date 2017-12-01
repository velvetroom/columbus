import UIKit

struct MPlansDetailItemStop:MPlansDetailItemProtocol
{
    let icon:UIImage
    let reusableIdentifier:String = VPlansDetailListCellStop.reusableIdentifier
    let cellHeight:CGFloat = 42
    let title:String
}