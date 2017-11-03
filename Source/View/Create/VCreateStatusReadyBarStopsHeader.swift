import UIKit

final class VCreateStatusReadyBarStopsHeader:
    UICollectionReusableView
{
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        isUserInteractionEnabled = false
        
        let icon:UIImageView = UIImageView()
        icon.isUserInteractionEnabled = false
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.clipsToBounds = true
        icon.contentMode = UIViewContentMode.center
        icon.image = #imageLiteral(resourceName: "assetGenericLocationWhite")
        
        addSubview(icon)
        
        NSLayoutConstraint.equals(
            view:icon,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
