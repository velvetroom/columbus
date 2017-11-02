import UIKit

final class VHomeStandbyCell:UICollectionViewCell
{
    weak var icon:UIImageView!
    weak var labelInfo:UILabel!
    weak var layoutInfoHeight:NSLayoutConstraint!
    let kIconWidth:CGFloat = 90
    let kInfoTop:CGFloat = 10
    let kInfoRight:CGFloat = -10
    let kInfoMaxHeight:CGFloat = 200
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.white
        
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
