import UIKit

final class VStoreStatusLoading:View<ArchStore>
{
    private weak var layoutTitleTop:NSLayoutConstraint!
    
    required init(controller:CStore)
    {
        super.init(controller:controller)
        clipsToBounds = true
        isUserInteractionEnabled = false
        
        let icon:UIImageView = UIImageView()
        icon.isUserInteractionEnabled = false
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.clipsToBounds = true
        icon.contentMode = UIViewContentMode.center
        icon.image = #imageLiteral(resourceName: "assetMenuStore")
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.textAlignment = NSTextAlignment.center
        labelTitle.font = UIFont.regular(size:kFontSize)
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.textColor = UIColor.colourBackgroundDark
        labelTitle.text = String.localizedView(
            key:"VStoreStatusLoading_labelTitle")
        
        addSubview(icon)
        addSubview(labelTitle)
        
        NSLayoutConstraint.equals(
            view:icon,
            toView:self)
        
        layoutTitleTop = NSLayoutConstraint.topToTop(
            view:labelTitle,
            toView:self)
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
    
    override func layoutSubviews()
    {
        let height:CGFloat = bounds.height
        let titleTop:CGFloat = height / 2.0
        layoutTitleTop.constant = titleTop
        
        super.layoutSubviews()
    }
}
