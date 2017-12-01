import UIKit

extension VPlansDetailListCell
{
    //MARK: internal
    
    func factoryViews()
    {
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.font = UIFont.regular(size:VPlansDetailListCell.Constants.fontSize)
        labelTitle.numberOfLines = 0
        self.labelTitle = labelTitle
        
        let icon:UIImageView = UIImageView()
        icon.isUserInteractionEnabled = false
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.clipsToBounds = true
        icon.contentMode = UIViewContentMode.center
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
            constant:VPlansDetailListCell.Constants.iconWidth)
        
        NSLayoutConstraint.equalsVertical(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.leftToRight(
            view:labelTitle,
            toView:icon)
        NSLayoutConstraint.rightToRight(
            view:labelTitle,
            toView:self,
            constant:VPlansDetailListCell.Constants.titleRight)
    }
}
