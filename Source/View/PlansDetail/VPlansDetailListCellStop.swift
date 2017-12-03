import UIKit

final class VPlansDetailListCellStop:VPlansDetailListCell
{
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        factoryViews()
        
        labelTitle.textColor = UIColor.colourBackgroundDark
        icon.tintColor = UIColor.colourBackgroundDark
        labelTitle.font = UIFont.regular(size:VPlansDetailListCell.Constants.fontSizeTitle)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func config(model:MPlansDetailItemProtocol)
    {
        super.config(model:model)
        
        guard
            
            let modelStop:MPlansDetailItemStop = model as? MPlansDetailItemStop
            
        else
        {
            return
        }
        
        icon.image = modelStop.icon.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
    }
}
