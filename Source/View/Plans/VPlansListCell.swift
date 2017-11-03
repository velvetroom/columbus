import UIKit

final class VPlansListCell:UICollectionViewCell
{
    weak var labelOrigin:UILabel!
    weak var labelDestination:UILabel!
    let kRouteWidth:CGFloat = 48
    let kRouteHeight:CGFloat = 66
    let kLabelOriginTop:CGFloat = 12
    let kLabelDestinationTop:CGFloat = 5
    let kLabelRouteHeight:CGFloat = 20
    let kLabelRouteRight:CGFloat = -10
    let kRouteFontSize:CGFloat = 12
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        backgroundColor = UIColor.white
        clipsToBounds = true
        
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: internal
    
    func config(model:DPlan)
    {
        updateRoute(model:model)
    }
}
