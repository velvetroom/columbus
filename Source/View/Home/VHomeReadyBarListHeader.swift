import UIKit

final class VHomeReadyBarListHeader:UICollectionReusableView
{
    weak var labelDistance:UILabel!
    weak var labelDuration:UILabel!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.white
        isUserInteractionEnabled = false
        
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    
    
    //MARK: internal
    
    func config(controller:CHome)
    {
        
    }
}
