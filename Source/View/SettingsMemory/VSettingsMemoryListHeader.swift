import UIKit

final class VSettingsMemoryListHeader:UICollectionReusableView
{
    weak var viewBar:VSettingsMemoryListHeaderBar?
    weak var labelUsage:UILabel!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
