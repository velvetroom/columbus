import UIKit

extension VHomeStandbyCell
{
    //MARK: internal
    
    func factoryViews()
    {
        let icon:UIImageView = UIImageView()
        self.icon = icon
        
        let labelInfo:UILabel = UILabel()
        labelInfo.isUserInteractionEnabled = false
        labelInfo.translatesAutoresizingMaskIntoConstraints = false
        labelInfo.backgroundColor = UIColor.clear
        labelInfo.numberOfLines = 0
        self.labelInfo = labelInfo
        
        addSubview(icon)
        addSubview(labelInfo)
        
        NSLayoutConstraint.equalsVertical(
            view:icon,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:icon,
            toView:self)
        NSLayoutConstraint.width(
            view:icon,
            constant:kIconWidth)
        
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
