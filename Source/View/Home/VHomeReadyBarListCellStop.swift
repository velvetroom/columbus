import UIKit

final class VHomeReadyBarListCellStop:VHomeReadyBarListCell
{
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func config(model:MHomePlanItemProtocol)
    {
        super.config(model:model)
        
        guard
            
            let modelStop:MHomePlanItemStop = model as? MHomePlanItemStop
        
        else
        {
            return
        }
        
        icon.image = modelStop.icon.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        hover()
    }
    
    override var isSelected:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    override var isHighlighted:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    //MARK: private
    
    private func hover()
    {
        if isSelected || isHighlighted
        {
            backgroundColor = UIColor.colourSuccess
            labelTitle.textColor = UIColor.white
            icon.tintColor = UIColor.white
        }
        else
        {
            backgroundColor = UIColor.white
            labelTitle.textColor = UIColor.colourBackgroundDark
            icon.tintColor = UIColor(white:0, alpha:0.2)
        }
    }
}
