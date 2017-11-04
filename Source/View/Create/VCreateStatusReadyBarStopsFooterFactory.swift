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
        iconDistance.image = #imageLiteral(resourceName: "assetMapDuration")
        
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
        self.labelDurationValue = labelDurationValue
        
        addSubview(iconDistance)
        addSubview(iconDuration)
        addSubview(labelDistanceValue)
        addSubview(labelDurationValue)
        
        NSLayoutConstraint.topToTop(
            view:iconDistance,
            toView:self,
            constant:kDistanceTop)
        NSLayoutConstraint.height(
            view:iconDistance,
            constant:kLabelHeight)
        NSLayoutConstraint.leftToLeft(
            view:iconDistance,
            toView:self,
            constant:kIconLeft)
        NSLayoutConstraint.width(
            view:iconDistance,
            constant:kIconWidth)
        
        NSLayoutConstraint.topToTop(
            view:labelDistanceValue,
            toView:self,
            constant:kDistanceTop)
        NSLayoutConstraint.height(
            view:labelDistanceValue,
            constant:kLabelHeight)
        NSLayoutConstraint.leftToRight(
            view:labelDistanceValue,
            toView:iconDistance)
        NSLayoutConstraint.width(
            view:labelDistanceValue,
            constant:kValueWidth)
        
        NSLayoutConstraint.topToBottom(
            view:iconDuration,
            toView:iconDistance)
        NSLayoutConstraint.height(
            view:iconDuration,
            constant:kLabelHeight)
        NSLayoutConstraint.leftToLeft(
            view:iconDuration,
            toView:self,
            constant:kIconLeft)
        NSLayoutConstraint.width(
            view:iconDuration,
            constant:kIconWidth)
        
        NSLayoutConstraint.topToBottom(
            view:labelDurationValue,
            toView:labelDistanceValue)
        NSLayoutConstraint.height(
            view:labelDurationValue,
            constant:kLabelHeight)
        NSLayoutConstraint.leftToRight(
            view:labelDurationValue,
            toView:iconDuration)
        NSLayoutConstraint.width(
            view:labelDurationValue,
            constant:kValueWidth)
    }
}
