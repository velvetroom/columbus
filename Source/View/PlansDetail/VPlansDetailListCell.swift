import UIKit

final class VPlansDetailListCell:UICollectionViewCell
{
    weak var labelTitle:UILabel!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        isUserInteractionEnabled = false
        
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: internal
    
    func config(model:DPlanStop)
    {
        labelTitle.text = model.name
    }
}
