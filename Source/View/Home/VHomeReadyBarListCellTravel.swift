import UIKit

final class VHomeReadyBarListCellTravel:VHomeReadyBarListCell
{
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        isUserInteractionEnabled = false
        
        factoryViews()
        
        labelTitle.textColor = UIColor(white:0, alpha:0.4)
        icon.image = #imageLiteral(resourceName: "assetGenericStopDuration")
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
