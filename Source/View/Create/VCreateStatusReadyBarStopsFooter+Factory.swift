import UIKit

extension VCreateStatusReadyBarStopsFooter
{
    //MARK: internal
    
    func factoryViews()
    {
        let iconDistance:UIImageView = UIImageView()
        iconDistance.translatesAutoresizingMaskIntoConstraints = false
        iconDistance.clipsToBounds = true
        iconDistance.contentMode = UIViewContentMode.center
        iconDistance.isUserInteractionEnabled = false
        iconDistance.image = #imageLiteral(resourceName: "assetMapDistance")
        
        let labelDistanceValue:UILabel = UILabel()
        labelDistanceValue.isUserInteractionEnabled = false
        labelDistanceValue.translatesAutoresizingMaskIntoConstraints = false
        labelDistanceValue.backgroundColor = UIColor.clear
        labelDistanceValue.font = UIFont.medium(size:VCreateStatusReadyBarStopsFooter.Constants.UI.valueFontSize)
        labelDistanceValue.textColor = UIColor.white
        self.labelDistanceValue = labelDistanceValue
        
        let iconDuration:UIImageView = UIImageView()
        iconDuration.translatesAutoresizingMaskIntoConstraints = false
        iconDuration.clipsToBounds = true
        iconDuration.contentMode = UIViewContentMode.center
        iconDuration.isUserInteractionEnabled = false
        iconDuration.image = #imageLiteral(resourceName: "assetMapDuration")
        
        let labelDurationValue:UILabel = UILabel()
        labelDurationValue.isUserInteractionEnabled = false
        labelDurationValue.translatesAutoresizingMaskIntoConstraints = false
        labelDurationValue.backgroundColor = UIColor.clear
        labelDurationValue.font = UIFont.medium(size:VCreateStatusReadyBarStopsFooter.Constants.UI.valueFontSize)
        labelDurationValue.textColor = UIColor.white
        labelDurationValue.textAlignment = NSTextAlignment.right
        self.labelDurationValue = labelDurationValue
        
        addSubview(iconDistance)
        addSubview(iconDuration)
        addSubview(labelDistanceValue)
        addSubview(labelDurationValue)
        
        NSLayoutConstraint.topToTop(
            view:iconDistance,
            toView:self,
            constant:VCreateStatusReadyBarStopsFooter.Constants.UI.contentTop)
        NSLayoutConstraint.height(
            view:iconDistance,
            constant:VCreateStatusReadyBarStopsFooter.Constants.UI.labelHeight)
        NSLayoutConstraint.leftToLeft(
            view:iconDistance,
            toView:self,
            constant:VCreateStatusReadyBarStopsFooter.Constants.UI.iconMarginHorizontal)
        NSLayoutConstraint.width(
            view:iconDistance,
            constant:VCreateStatusReadyBarStopsFooter.Constants.UI.iconWidth)
        
        NSLayoutConstraint.topToTop(
            view:labelDistanceValue,
            toView:self,
            constant:VCreateStatusReadyBarStopsFooter.Constants.UI.contentTop)
        NSLayoutConstraint.height(
            view:labelDistanceValue,
            constant:VCreateStatusReadyBarStopsFooter.Constants.UI.labelHeight)
        NSLayoutConstraint.leftToRight(
            view:labelDistanceValue,
            toView:iconDistance)
        NSLayoutConstraint.width(
            view:labelDistanceValue,
            constant:VCreateStatusReadyBarStopsFooter.Constants.UI.valueWidth)
        
        NSLayoutConstraint.topToTop(
            view:iconDuration,
            toView:self,
            constant:VCreateStatusReadyBarStopsFooter.Constants.UI.contentTop)
        NSLayoutConstraint.height(
            view:iconDuration,
            constant:VCreateStatusReadyBarStopsFooter.Constants.UI.labelHeight)
        NSLayoutConstraint.rightToRight(
            view:iconDuration,
            toView:self,
            constant:-VCreateStatusReadyBarStopsFooter.Constants.UI.iconMarginHorizontal)
        NSLayoutConstraint.width(
            view:iconDuration,
            constant:VCreateStatusReadyBarStopsFooter.Constants.UI.iconWidth)
        
        NSLayoutConstraint.topToTop(
            view:labelDurationValue,
            toView:self,
            constant:VCreateStatusReadyBarStopsFooter.Constants.UI.contentTop)
        NSLayoutConstraint.height(
            view:labelDurationValue,
            constant:VCreateStatusReadyBarStopsFooter.Constants.UI.labelHeight)
        NSLayoutConstraint.rightToLeft(
            view:labelDurationValue,
            toView:iconDuration)
        NSLayoutConstraint.width(
            view:labelDurationValue,
            constant:VCreateStatusReadyBarStopsFooter.Constants.UI.valueWidth)
    }
}
