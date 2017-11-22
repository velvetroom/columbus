import UIKit

extension VSettingsMemoryListCell
{
    //MARK: internal
    
    func factoryViews()
    {
        let labelOrigin:UILabel = UILabel()
        labelOrigin.translatesAutoresizingMaskIntoConstraints = false
        labelOrigin.backgroundColor = UIColor.clear
        labelOrigin.isUserInteractionEnabled = false
        labelOrigin.font = UIFont.regular(size:VSettingsMemoryListCell.Constants.fontSize)
        labelOrigin.textColor = UIColor(white:0, alpha:0.6)
        self.labelOrigin = labelOrigin
        
        let icon:UIImageView = UIImageView()
        icon.isUserInteractionEnabled = false
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.clipsToBounds = true
        icon.contentMode = UIViewContentMode.center
        icon.image = #imageLiteral(resourceName: "assetPlansRoute")
        
        addSubview(icon)
        addSubview(labelOrigin)
        
        NSLayoutConstraint.equalsVertical(
            view:icon,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:icon,
            toView:self)
        NSLayoutConstraint.width(
            view:icon,
            constant:VSettingsMemoryListCell.Constants.iconWidth)
        
        NSLayoutConstraint.topToTop(
            view:labelOrigin,
            toView:self)
        NSLayoutConstraint.height(
            view:labelOrigin,
            constant:VSettingsMemoryListCell.Constants.locationsHeight)
        NSLayoutConstraint.leftToRight(
            view:labelOrigin,
            toView:icon)
        NSLayoutConstraint.rightToLeft(
            view:labelOrigin,
            toView:labelSize)
    }
}
