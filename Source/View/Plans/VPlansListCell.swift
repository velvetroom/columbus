import UIKit

final class VPlansListCell:UICollectionViewCell
{
    weak var labelOrigin:UILabel!
    weak var labelDestination:UILabel!
    weak var labelCreated:UILabel!
    weak var imageRoute:UIImageView!
    let dateFormatter:DateFormatter
    let kRouteWidth:CGFloat = 48
    let kRouteHeight:CGFloat = 66
    let kLabelOriginTop:CGFloat = 12
    let kLabelDestinationTop:CGFloat = 5
    let kLabelRouteHeight:CGFloat = 20
    let kLabelRouteRight:CGFloat = -10
    let kRouteFontSize:CGFloat = 12
    let kCreatedHeight:CGFloat = 42
    let kCreatedWidth:CGFloat = 200
    let kCreatedFontSize:CGFloat = 12
    
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
    
    func config(model:DPlan)
    {
        updateRoute(model:model)
        updateCreated(model:model)
        hover()
    }
}
