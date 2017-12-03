import UIKit

final class VHomeReadyBarListCellTravel:VHomeReadyBarListCell
{
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        isUserInteractionEnabled = false
        
        factoryViews()
        
        labelTitle.textColor = UIColor(white:0, alpha:0.5)
        icon.image = #imageLiteral(resourceName: "assetGenericStopDuration").withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        icon.tintColor = UIColor(white:0, alpha:0.2)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
