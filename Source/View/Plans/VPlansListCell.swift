import UIKit

final class VPlansListCell:UICollectionViewCell
{
    weak var labelOrigin:UILabel!
    weak var labelDestination:UILabel!
    weak var labelCreated:UILabel!
    weak var imageRoute:UIImageView!
    weak var viewButton:VPlansListCellButton?
    let dateFormatter:DateFormatter
    
    override init(frame:CGRect)
    {
        dateFormatter = VPlansListCell.factoryDateFormatter()
        
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
            imageRoute.tintColor = UIColor.white
            labelOrigin.textColor = UIColor.white
            labelDestination.textColor = UIColor.white
            labelCreated.textColor = UIColor.white
        }
        else
        {
            backgroundColor = UIColor.white
            imageRoute.tintColor = UIColor.colourSuccess
            labelOrigin.textColor = UIColor.colourBackgroundDark
            labelDestination.textColor = UIColor.colourBackgroundDark
            labelCreated.textColor = UIColor(white:0, alpha:0.4)
        }
    }
    
    //MARK: internal
    
    func config(
        controller:CPlans,
        model:DPlan,
        active:Bool)
    {
        updateRoute(model:model)
        updateCreated(model:model)
        updateButton(
            controller:controller,
            model:model,
            active:active)
        
        hover()
    }
}
