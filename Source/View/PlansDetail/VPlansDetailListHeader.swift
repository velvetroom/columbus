import UIKit

final class VPlansDetailListHeader:UICollectionReusableView
{
    weak var labelDuration:UILabel!
    weak var labelDistance:UILabel!
    
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
    
    func config(controller:CPlansDetail)
    {
        
    }
}
