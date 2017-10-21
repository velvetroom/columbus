import UIKit

final class VCreateStatusReadyBarStopsCell:
    UICollectionViewCell
{
    let kFieldLeft:CGFloat = 100
    let kRemoveWidth:CGFloat = 80
    let kFieldMarginVertical:CGFloat = 5
    
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
