import UIKit

final class VPlansListCell:UICollectionViewCell
{
    let kRouteWidth:CGFloat = 60
    let kRouteHeight:CGFloat = 80
    
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
