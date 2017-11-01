import UIKit

final class VPlansListCell:UICollectionViewCell
{
    weak var labelOrigin:UILabel!
    weak var labelDestination:UILabel!
    let kRouteWidth:CGFloat = 60
    let kRouteHeight:CGFloat = 80
    let kLabelRouteTop:CGFloat = 20
    let kLabelRouteHeight:CGFloat = 20
    let kLabelRouteRight:CGFloat = -10
    let kRouteFontSize:CGFloat = 14
    
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
        
    }
}
