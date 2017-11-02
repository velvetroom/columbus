import UIKit

final class VHomeStandbyCell:UICollectionViewCell
{
    weak var icon:UIImageView!
    weak var labelInfo:UILabel!
    weak var layoutInfoHeight:NSLayoutConstraint!
    let kIconSize:CGFloat = 60
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
    
    //MARK: internal
    
    func config(model:MHomeInfoProtocol)
    {
        icon.image = model.icon
    }
}
