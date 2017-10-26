import UIKit

final class VCreateStatusReadyBarStopsFooter:
    UICollectionReusableView
{
    weak var labelDistanceValue:UILabel!
    weak var labelDurationValue:UILabel!
    let kFontSize:CGFloat = 14
    let kTitleLeft:CGFloat = 10
    let kTitleWidth:CGFloat = 100
    let kValueWidth:CGFloat = 200
    let kDistanceTop:CGFloat = 10
    let kLabelHeight:CGFloat = 24
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: internal
    
    func config(model:[DPlanTravel])
    {
    }
}
