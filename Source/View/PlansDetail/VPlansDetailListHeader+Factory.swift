import UIKit

extension VPlansDetailListHeader
{
    //MARK: internal
    
    func factoryViews()
    {
        let border:VBorder = VBorder(colour:UIColor(white:0, alpha:0.2))
        
        let iconDistance:UIImageView = UIImageView()
        iconDistance.isUserInteractionEnabled = false
        iconDistance.translatesAutoresizingMaskIntoConstraints = false
        iconDistance.clipsToBounds = true
        iconDistance.contentMode = UIViewContentMode.center
        iconDistance.tintColor = UIColor.colourBackgroundDark
        iconDistance.image = #imageLiteral(resourceName: "assetMapDistance").withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        
        let labelDistance:UILabel = UILabel()
        labelDistance.translatesAutoresizingMaskIntoConstraints = false
        labelDistance.backgroundColor = UIColor.clear
        labelDistance.isUserInteractionEnabled = false
        labelDistance.font = UIFont.regular(size:VPlansDetailListHeader.Constants.fontSize)
        labelDistance.textColor = UIColor.colourBackgroundDark
        self.labelDistance = labelDistance
        
        let iconDuration:UIImageView = UIImageView()
        iconDuration.isUserInteractionEnabled = false
        iconDuration.translatesAutoresizingMaskIntoConstraints = false
        iconDuration.clipsToBounds = true
        iconDuration.contentMode = UIViewContentMode.center
        iconDuration.tintColor = UIColor.colourBackgroundDark
        iconDuration.image = #imageLiteral(resourceName: "assetMapDuration").withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        
        let labelDuration:UILabel = UILabel()
        labelDuration.translatesAutoresizingMaskIntoConstraints = false
        labelDuration.backgroundColor = UIColor.clear
        labelDuration.isUserInteractionEnabled = false
        labelDuration.font = UIFont.regular(size:VPlansDetailListHeader.Constants.fontSize)
        labelDuration.textColor = UIColor.colourBackgroundDark
        labelDuration.textAlignment = NSTextAlignment.right
        self.labelDuration = labelDuration
        
        addSubview(border)
        addSubview(iconDuration)
        addSubview(iconDistance)
        addSubview(labelDistance)
        addSubview(labelDuration)
        
        NSLayoutConstraint.bottomToBottom(
            view:border,
            toView:self)
        NSLayoutConstraint.height(
            view:border,
            constant:ViewMain.Constants.borderWidth)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
        
        NSLayoutConstraint.bottomToBottom(
            view:iconDistance,
            toView:self)
        NSLayoutConstraint.height(
            view:iconDistance,
            constant:VPlansDetailListHeader.Constants.contentHeight)
        NSLayoutConstraint.leftToLeft(
            view:iconDistance,
            toView:self)
        NSLayoutConstraint.width(
            view:iconDistance,
            constant:VPlansDetailListHeader.Constants.iconWidth)
        
        NSLayoutConstraint.bottomToBottom(
            view:labelDistance,
            toView:self)
        NSLayoutConstraint.height(
            view:labelDistance,
            constant:VPlansDetailListHeader.Constants.contentHeight)
        NSLayoutConstraint.leftToRight(
            view:labelDistance,
            toView:iconDistance,
            constant:-VPlansDetailListHeader.Constants.iconPadding)
        NSLayoutConstraint.widthGreaterOrEqual(
            view:labelDistance)
        
        NSLayoutConstraint.bottomToBottom(
            view:iconDuration,
            toView:self)
        NSLayoutConstraint.height(
            view:iconDuration,
            constant:VPlansDetailListHeader.Constants.contentHeight)
        NSLayoutConstraint.rightToRight(
            view:iconDuration,
            toView:self)
        NSLayoutConstraint.width(
            view:iconDuration,
            constant:VPlansDetailListHeader.Constants.iconWidth)
        
        NSLayoutConstraint.bottomToBottom(
            view:labelDuration,
            toView:self)
        NSLayoutConstraint.height(
            view:labelDuration,
            constant:VPlansDetailListHeader.Constants.contentHeight)
        NSLayoutConstraint.rightToLeft(
            view:labelDuration,
            toView:iconDuration,
            constant:VPlansDetailListHeader.Constants.iconPadding)
        NSLayoutConstraint.widthGreaterOrEqual(
            view:labelDuration)
    }
}
