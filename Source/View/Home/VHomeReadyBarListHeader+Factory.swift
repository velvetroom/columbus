import UIKit

extension VHomeReadyBarListHeader
{
    //MARK: internal
    
    func factoryViews()
    {
        let border:VBorder = VBorder(colour:UIColor.colourBackgroundGray)
      
        let colour:UIColor = UIColor.colourBackgroundDark.withAlphaComponent(0.45)
        
        let iconDistance:UIImageView = UIImageView()
        iconDistance.translatesAutoresizingMaskIntoConstraints = false
        iconDistance.clipsToBounds = true
        iconDistance.contentMode = UIViewContentMode.center
        iconDistance.isUserInteractionEnabled = false
        iconDistance.image = #imageLiteral(resourceName: "assetMapDistance").withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        iconDistance.tintColor = colour
        
        let iconDuration:UIImageView = UIImageView()
        iconDuration.translatesAutoresizingMaskIntoConstraints = false
        iconDuration.clipsToBounds = true
        iconDuration.isUserInteractionEnabled = false
        iconDuration.contentMode = UIViewContentMode.center
        iconDuration.image = #imageLiteral(resourceName: "assetMapDuration").withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        iconDuration.tintColor = colour
        
        let labelDistance:UILabel = UILabel()
        labelDistance.isUserInteractionEnabled = false
        labelDistance.backgroundColor = UIColor.clear
        labelDistance.translatesAutoresizingMaskIntoConstraints = false
        labelDistance.textColor = colour
        labelDistance.font = UIFont.regular(size:VHomeReadyBarListHeader.Constants.fontSize)
        self.labelDistance = labelDistance
        
        let labelDuration:UILabel = UILabel()
        labelDuration.backgroundColor = UIColor.clear
        labelDuration.isUserInteractionEnabled = false
        labelDuration.translatesAutoresizingMaskIntoConstraints = false
        labelDuration.textColor = colour
        labelDuration.font = UIFont.regular(size:VHomeReadyBarListHeader.Constants.fontSize)
        self.labelDuration = labelDuration
        
        addSubview(border)
        addSubview(labelDuration)
        addSubview(labelDistance)
        addSubview(iconDistance)
        addSubview(iconDuration)
        
        NSLayoutConstraint.bottomToBottom(
            view:border,
            toView:self)
        NSLayoutConstraint.height(
            view:border,
            constant:ViewMain.Constants.borderWidth)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
        
        NSLayoutConstraint.equalsVertical(
            view:iconDistance,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:iconDistance,
            toView:self)
        NSLayoutConstraint.width(
            view:iconDistance,
            constant:VHomeReadyBarListHeader.Constants.iconWidth)
        
        NSLayoutConstraint.equalsVertical(
            view:iconDuration,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:iconDuration,
            toView:self)
        NSLayoutConstraint.width(
            view:iconDuration,
            constant:VHomeReadyBarListHeader.Constants.iconWidth)
        
        NSLayoutConstraint.equalsVertical(
            view:labelDistance,
            toView:self)
        NSLayoutConstraint.leftToRight(
            view:labelDistance,
            toView:iconDistance)
        NSLayoutConstraint.widthGreaterOrEqual(
            view:labelDistance)
        
        NSLayoutConstraint.equalsVertical(
            view:labelDuration,
            toView:self)
        NSLayoutConstraint.rightToLeft(
            view:labelDuration,
            toView:iconDuration)
        NSLayoutConstraint.widthGreaterOrEqual(
            view:labelDuration)
    }
}
