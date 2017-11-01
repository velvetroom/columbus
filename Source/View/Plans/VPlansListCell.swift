import UIKit

final class VPlansListCell:UICollectionViewCell
{
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        backgroundColor = UIColor.white
        clipsToBounds = true
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
