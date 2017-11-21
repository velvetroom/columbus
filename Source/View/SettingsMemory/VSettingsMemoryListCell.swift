import UIKit

final class VSettingsMemoryListCell:UICollectionViewCell
{
    weak var labelOrigin:UILabel!
    weak var labelDestination:UILabel!
    weak var labelSize:UILabel!
    
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
