import UIKit

final class VHomeReadyBarListCell:UICollectionViewCell
{
    weak var labelTitle:UILabel!
    weak var icon:UIImageView!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
