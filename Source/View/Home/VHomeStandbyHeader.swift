import UIKit

final class VHomeStandbyHeader:View<ArchHome>
{
    private let kFontSize:CGFloat = 14
    private let kIconTop:CGFloat = 80
    private let kIconHeight:CGFloat = 60
    private let kTitleHeight:CGFloat = 20
    
    required init(controller:CHome)
    {
        super.init(controller:controller)
        isUserInteractionEnabled = false
        clipsToBounds = true
        backgroundColor = UIColor.white
        
        let icon:UIImageView = UIImageView()
        icon.isUserInteractionEnabled = false
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.clipsToBounds = true
        icon.contentMode = UIViewContentMode.center
        icon.image = #imageLiteral(resourceName: "assetGenericLogo")
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.textAlignment = NSTextAlignment.center
        labelTitle.font = UIFont.bold(size:kFontSize)
        labelTitle.textColor = UIColor.colourSuccess
        labelTitle.text = String.localizedView(
            key:"VHomeStandbyHeader_labelTitle")
        
        addSubview(icon)
        addSubview(labelTitle)
        
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
            view:labelTitle,
            toView:icon)
        NSLayoutConstraint.height(
            view:labelTitle,
            constant:kTitleHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:labelTitle,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
