import UIKit

extension VSettingsMemoryListCell
{
    //MARK: internal
    
    func factoryViews()
    {
        let locationsColour:UIColor = UIColor(white:0, alpha:0.6)
        
        let labelOrigin:UILabel = UILabel()
        labelOrigin.translatesAutoresizingMaskIntoConstraints = false
        labelOrigin.backgroundColor = UIColor.clear
        labelOrigin.isUserInteractionEnabled = false
        labelOrigin.font = UIFont.regular(size:VSettingsMemoryListCell.Constants.fontSize)
        labelOrigin.textColor = locationsColour
        self.labelOrigin = labelOrigin
        
        let labelDestination:UILabel = UILabel()
        labelDestination.translatesAutoresizingMaskIntoConstraints = false
        labelDestination.backgroundColor = UIColor.clear
        labelDestination.isUserInteractionEnabled = false
        labelDestination.font = UIFont.regular(size:VSettingsMemoryListCell.Constants.fontSize)
        labelDestination.textColor = locationsColour
        self.labelDestination = labelDestination
        
        let labelSize:UILabel = UILabel()
        labelSize.translatesAutoresizingMaskIntoConstraints = false
        labelSize.backgroundColor = UIColor.clear
        labelSize.isUserInteractionEnabled = false
        labelSize.font = UIFont.regular(size:VSettingsMemoryListCell.Constants.fontSize)
        labelSize.textAlignment = NSTextAlignment.right
        labelSize.textColor = UIColor(white:0, alpha:0.4)
        self.labelSize = labelSize
        
        let buttonDelete:UIButton = UIButton()
        buttonDelete.translatesAutoresizingMaskIntoConstraints = false
        buttonDelete.setTitleColor(
            UIColor.colourFail,
            for:UIControlState.normal)
        buttonDelete.setTitleColor(
            UIColor.colourBackgroundGray,
            for:UIControlState.highlighted)
        buttonDelete.setTitle(
            String.localizedView(key:"VSettingsMemoryListCell_buttonRemove"),
            for:UIControlState.normal)
        buttonDelete.titleLabel!.font = UIFont.bold(size:VSettingsMemoryListCell.Constants.fontSize)
        
        let icon:UIImageView = UIImageView()
        icon.isUserInteractionEnabled = false
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.clipsToBounds = true
        icon.contentMode = UIViewContentMode.center
        icon.image = #imageLiteral(resourceName: "assetPlansRoute")
        
        addSubview(icon)
        addSubview(labelOrigin)
        addSubview(labelDestination)
        addSubview(labelSize)
        addSubview(buttonDelete)
        
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
            toView:labelSize,
            constant:VSettingsMemoryListCell.Constants.sizeLeft)
        
        NSLayoutConstraint.bottomToBottom(
            view:labelDestination,
            toView:self)
        NSLayoutConstraint.height(
            view:labelOrigin,
            constant:VSettingsMemoryListCell.Constants.locationsHeight)
        NSLayoutConstraint.leftToRight(
            view:labelOrigin,
            toView:icon)
        NSLayoutConstraint.rightToLeft(
            view:labelOrigin,
            toView:labelSize,
            constant:VSettingsMemoryListCell.Constants.sizeLeft)
        
        NSLayoutConstraint.equalsVertical(
            view:labelSize,
            toView:self)
        NSLayoutConstraint.rightToLeft(
            view:labelSize,
            toView:buttonDelete,
            constant:VSettingsMemoryListCell.Constants.sizeRight)
        NSLayoutConstraint.widthGreaterOrEqual(
            view:labelSize)
        
        NSLayoutConstraint.equalsVertical(
            view:buttonDelete,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:buttonDelete,
            toView:self)
        NSLayoutConstraint.width(
            view:buttonDelete,
            constant:VSettingsMemoryListCell.Constants.deleteWidth)
    }
}
