import UIKit

final class VPlansDetailListCellTravel:VPlansDetailListCell
{
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        factoryViews()
        
        labelTitle.textColor = UIColor(white:0, alpha:0.5)
        icon.image = #imageLiteral(resourceName: "assetGenericStopDuration").withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        icon.tintColor = UIColor.colourBackgroundDark
        labelTitle.font = UIFont.regular(size:VPlansDetailListCell.Constants.fontSizeSubtitle)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
