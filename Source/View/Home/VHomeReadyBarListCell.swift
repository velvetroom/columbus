import UIKit

class VHomeReadyBarListCell:UICollectionViewCell
{
    weak var labelTitle:UILabel!
    weak var icon:UIImageView!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: internal
    
    func config(model:MHomePlanItemProtocol)
    {
        labelTitle.text = model.title        
    }
}
