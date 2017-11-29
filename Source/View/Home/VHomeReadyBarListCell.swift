import UIKit

class VHomeReadyBarListCell:UICollectionViewCell
{
    weak var labelTitle:UILabel!
    weak var icon:UIImageView!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
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
    
    //MARK: internal
    
    func config(model:DPlanStop)
    {
        let iconImage:UIImage? = VPlanStop.factoryIcon(stop:model)
        
        labelTitle.text = model.name
        icon.image = iconImage?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        
        hover()
    }
}
