import UIKit

final class VCreateStatusReadyBarStopsHeader:
    UICollectionReusableView
{
    private let kIconTop:CGFloat = 70
    private let kIconHeight:CGFloat = 60
    private let kLabelHeight:CGFloat = 60
    private let kFontSize:CGFloat = 15
    
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
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.center
        label.numberOfLines = 0
        label.textColor = UIColor.white
        label.font = UIFont.regular(size:kFontSize)
        label.text = String.localizedView(
            key:"VCreateStatusReadyBarStopsHeader_label")
        
        addSubview(icon)
        addSubview(label)
        
        NSLayoutConstraint.topToTop(
            view:icon,
            toView:self,
            constant:kIconTop)
        NSLayoutConstraint.height(
            view:icon,
            constant:kIconHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:icon,
            toView:self)
        
        NSLayoutConstraint.topToBottom(
            view:label,
            toView:icon)
        NSLayoutConstraint.height(
            view:label,
            constant:kLabelHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:label,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
