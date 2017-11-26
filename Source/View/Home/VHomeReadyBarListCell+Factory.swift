import UIKit

extension VHomeReadyBarListCell
{
    //MARK: internal
    
    func factoryViews()
    {
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.font = UIFont.regular(size:VHomeReadyBarListCell.Constants.fontSize)
        labelTitle.numberOfLines = 0
        self.labelTitle = labelTitle
        
        let icon:UIImageView = UIImageView()
        icon.isUserInteractionEnabled = false
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.clipsToBounds = true
        icon.contentMode = UIViewContentMode.center
        icon.image = #imageLiteral(resourceName: "assetGenericStop").withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        self.icon = icon
        
        addSubview(labelTitle)
        addSubview(icon)
        
        NSLayoutConstraint.equalsVertical(
            view:icon,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:icon,
            toView:self)
        NSLayoutConstraint.width(
            view:icon,
            constant:VHomeReadyBarListCell.Constants.iconWidth)
        
        NSLayoutConstraint.equalsVertical(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.leftToRight(
            view:labelTitle,
            toView:icon)
        NSLayoutConstraint.rightToRight(
            view:labelTitle,
            toView:self,
            constant:VHomeReadyBarListCell.Constants.titleRight)
    }
}
