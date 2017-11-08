import UIKit

final class VPlansListHeader:UICollectionReusableView
{
    private let kTextTop:CGFloat = 220
    private let kTextHeight:CGFloat = 50
    private let kFontSize:CGFloat = 15
    private let kIconHeight:CGFloat = 120
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        backgroundColor = UIColor.clear
        isUserInteractionEnabled = false
        clipsToBounds = true
        
        let labelText:UILabel = UILabel()
        labelText.isUserInteractionEnabled = false
        labelText.translatesAutoresizingMaskIntoConstraints = false
        labelText.backgroundColor = UIColor.clear
        labelText.numberOfLines = 0
        labelText.textAlignment = NSTextAlignment.center
        labelText.font = UIFont.regular(size:kFontSize)
        labelText.textColor = UIColor(white:0, alpha:0.7)
        labelText.text = String.localizedView(
            key:"VPlansListHeader_labelText")
        
        let icon:UIImageView = UIImageView()
        icon.isUserInteractionEnabled = false
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.clipsToBounds = true
        icon.contentMode = UIViewContentMode.center
        icon.image = #imageLiteral(resourceName: "assetGenericStandby")
        
        addSubview(labelText)
        addSubview(icon)
        
        NSLayoutConstraint.topToTop(
            view:labelText,
            toView:self,
            constant:kTextTop)
        NSLayoutConstraint.height(
            view:labelText,
            constant:kTextHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:labelText,
            toView:self)
        
        NSLayoutConstraint.bottomToTop(
            view:icon,
            toView:labelText)
        NSLayoutConstraint.height(
            view:icon,
            constant:kIconHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:icon,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
