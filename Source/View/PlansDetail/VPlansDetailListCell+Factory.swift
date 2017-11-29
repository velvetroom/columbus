import UIKit

extension VPlansDetailListCell
{
    //MARK: internal
    
    func factoryViews()
    {
        let icon:UIImageView = UIImageView()
        icon.isUserInteractionEnabled = false
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.clipsToBounds = true
        icon.contentMode = UIViewContentMode.center
        icon.image = #imageLiteral(resourceName: "assetGenericStop").withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        icon.tintColor = UIColor.colourBackgroundDark
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.font = UIFont.regular(size:VPlansDetailListCell.Constants.fontSize)
        labelTitle.textColor = UIColor.colourBackgroundDark
        labelTitle.numberOfLines = 0
        self.labelTitle = labelTitle
        
        addSubview(icon)
        addSubview(labelTitle)
        
        NSLayoutConstraint.leftToRight(
            view:labelTitle,
            toView:icon)
        NSLayoutConstraint.equalsVertical(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:labelTitle,
            toView:self,
            constant:VPlansDetailListCell.Constants.titleRight)
        
        NSLayoutConstraint.equalsVertical(
            view:icon,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:icon,
            toView:self)
        NSLayoutConstraint.width(
            view:icon,
            constant:VPlansDetailListCell.Constants.iconWidth)
    }
}
