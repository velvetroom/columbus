import UIKit

final class VSettingsMemoryListFooter:UICollectionReusableView
{
    weak var labelSize:UILabel!
    weak var buttonClean:UIButton!
    weak var labelEmpty:UILabel!
    
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
    
    func config(controller:CSettingsMemory)
    {
        
    }
}
