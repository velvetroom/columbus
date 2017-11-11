import UIKit

extension VCreateStatusReadyBarStopsFooter
{
    //MARK: internal
    
    class func factoryNumberFormatter(
        minIntegers:Int,
        maxDecimals:Int) -> NumberFormatter
    {
        let numberFormatter:NumberFormatter = NumberFormatter()
        numberFormatter.minimumIntegerDigits = minIntegers
        numberFormatter.maximumFractionDigits = maxDecimals

        return numberFormatter
    }
    
    class func factoryDistanceSuffixMap() -> [
        DSettingsDistance:String]
    {
        let suffixMap:[DSettingsDistance:String] = [
            DSettingsDistance.kilometres:
                String.localizedView(
                    key:"VCreateStatusReadyBarStopsFooter_kilometres"),
            DSettingsDistance.miles:
                String.localizedView(
                    key:"VCreateStatusReadyBarStopsFooter_miles")]
        
        return suffixMap
    }
    
    class func factoryDurationSuffixMap() -> [
        DPlanTravelDurationType:String]
    {
        let suffixMap:[DPlanTravelDurationType:String] = [
            DPlanTravelDurationType.days:
                String.localizedView(
                    key:"VCreateStatusReadyBarStopsFooter_durationDays"),
            DPlanTravelDurationType.hours:
                String.localizedView(
                    key:"VCreateStatusReadyBarStopsFooter_durationHours"),
            DPlanTravelDurationType.minutes:
                String.localizedView(
                    key:"VCreateStatusReadyBarStopsFooter_durationMinutes"),
            DPlanTravelDurationType.seconds:
                String.localizedView(
                    key:"VCreateStatusReadyBarStopsFooter_durationSeconds")]
        
        return suffixMap
    }
    
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
        labelDistanceValue.font = UIFont.medium(
            size:kValueFontSize)
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
        labelDurationValue.font = UIFont.medium(
            size:kValueFontSize)
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
            constant:kContentTop)
        NSLayoutConstraint.height(
            view:iconDistance,
            constant:kLabelHeight)
        NSLayoutConstraint.leftToLeft(
            view:iconDistance,
            toView:self,
            constant:kIconMarginHorizontal)
        NSLayoutConstraint.width(
            view:iconDistance,
            constant:kIconWidth)
        
        NSLayoutConstraint.topToTop(
            view:labelDistanceValue,
            toView:self,
            constant:kContentTop)
        NSLayoutConstraint.height(
            view:labelDistanceValue,
            constant:kLabelHeight)
        NSLayoutConstraint.leftToRight(
            view:labelDistanceValue,
            toView:iconDistance)
        NSLayoutConstraint.width(
            view:labelDistanceValue,
            constant:kValueWidth)
        
        NSLayoutConstraint.topToTop(
            view:iconDuration,
            toView:self,
            constant:kContentTop)
        NSLayoutConstraint.height(
            view:iconDuration,
            constant:kLabelHeight)
        NSLayoutConstraint.rightToRight(
            view:iconDuration,
            toView:self,
            constant:-kIconMarginHorizontal)
        NSLayoutConstraint.width(
            view:iconDuration,
            constant:kIconWidth)
        
        NSLayoutConstraint.topToTop(
            view:labelDurationValue,
            toView:self,
            constant:kContentTop)
        NSLayoutConstraint.height(
            view:labelDurationValue,
            constant:kLabelHeight)
        NSLayoutConstraint.rightToLeft(
            view:labelDurationValue,
            toView:iconDuration)
        NSLayoutConstraint.width(
            view:labelDurationValue,
            constant:kValueWidth)
    }
}
