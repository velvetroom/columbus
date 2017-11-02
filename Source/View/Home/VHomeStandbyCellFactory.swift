import UIKit

extension VHomeStandbyCell
{
    //MARK: internal
    
    func factoryViews()
    {
        let icon:UIImageView = UIImageView()
        icon.isUserInteractionEnabled = false
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.clipsToBounds = true
        icon.contentMode = UIViewContentMode.center
        self.icon = icon
        
        let labelInfo:UILabel = UILabel()
        labelInfo.isUserInteractionEnabled = false
        labelInfo.translatesAutoresizingMaskIntoConstraints = false
        labelInfo.backgroundColor = UIColor.clear
        labelInfo.numberOfLines = 0
        self.labelInfo = labelInfo
        
        addSubview(icon)
        addSubview(labelInfo)
        
        NSLayoutConstraint.topToTop(
            view:icon,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:icon,
            toView:self)
        NSLayoutConstraint.size(
            view:icon,
            constant:kIconSize)
        
        NSLayoutConstraint.topToTop(
            view:labelInfo,
            toView:self,
            constant:kInfoTop)
        layoutInfoHeight = NSLayoutConstraint.height(
            view:labelInfo)
        NSLayoutConstraint.leftToRight(
            view:labelInfo,
            toView:icon)
        NSLayoutConstraint.rightToRight(
            view:labelInfo,
            toView:self,
            constant:kInfoRight)
    }
}
