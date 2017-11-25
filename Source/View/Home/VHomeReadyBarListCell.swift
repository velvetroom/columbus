import UIKit

final class VHomeReadyBarListCell:UICollectionViewCell
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
            icon.tintColor = UIColor.colourBackgroundGray
        }
    }
    
    //MARK: internal
    
    func config(model:DPlanStop)
    {
        labelTitle.text = model.name
        hover()
    }
}
