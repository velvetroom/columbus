import UIKit

final class VPlansDetailListHeader:UICollectionReusableView
{
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        isUserInteractionEnabled = false
    }
    
    //MARK: internal
    
    func config(controller:CPlansDetail)
    {
        
    }
}
