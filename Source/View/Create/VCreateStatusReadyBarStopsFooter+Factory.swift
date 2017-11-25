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
        
        let labelDistance:UILabel = UILabel()
        labelDistance.isUserInteractionEnabled = false
        labelDistance.translatesAutoresizingMaskIntoConstraints = false
        labelDistance.backgroundColor = UIColor.clear
        labelDistance.font = UIFont.medium(size:VCreateStatusReadyBarStopsFooter.Constants.UI.valueFontSize)
        labelDistance.textColor = UIColor.white
        self.labelDistance = labelDistance
        
        let iconDuration:UIImageView = UIImageView()
        iconDuration.translatesAutoresizingMaskIntoConstraints = false
        iconDuration.clipsToBounds = true
        iconDuration.contentMode = UIViewContentMode.center
        iconDuration.isUserInteractionEnabled = false
        iconDuration.image = #imageLiteral(resourceName: "assetMapDuration")
        
        let labelDuration:UILabel = UILabel()
        labelDuration.isUserInteractionEnabled = false
        labelDuration.translatesAutoresizingMaskIntoConstraints = false
        labelDuration.backgroundColor = UIColor.clear
        labelDuration.font = UIFont.medium(size:VCreateStatusReadyBarStopsFooter.Constants.UI.valueFontSize)
        labelDuration.textColor = UIColor.white
        labelDuration.textAlignment = NSTextAlignment.right
        self.labelDuration = labelDuration
        
        addSubview(iconDistance)
        addSubview(iconDuration)
        addSubview(labelDistance)
        addSubview(labelDuration)
        
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
            view:labelDistance,
            toView:self,
            constant:VCreateStatusReadyBarStopsFooter.Constants.UI.contentTop)
        NSLayoutConstraint.height(
            view:labelDistance,
            constant:VCreateStatusReadyBarStopsFooter.Constants.UI.labelHeight)
        NSLayoutConstraint.leftToRight(
            view:labelDistance,
            toView:iconDistance)
        NSLayoutConstraint.width(
            view:labelDistance,
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
            view:labelDuration,
            toView:self,
            constant:VCreateStatusReadyBarStopsFooter.Constants.UI.contentTop)
        NSLayoutConstraint.height(
            view:labelDuration,
            constant:VCreateStatusReadyBarStopsFooter.Constants.UI.labelHeight)
        NSLayoutConstraint.rightToLeft(
            view:labelDuration,
            toView:iconDuration)
        NSLayoutConstraint.width(
            view:labelDuration,
            constant:VCreateStatusReadyBarStopsFooter.Constants.UI.valueWidth)
    }
}
