import Foundation

extension VCreateStatusReadyBarStopsFooter
{
    //MARK: private
    
    private class func factoryNumberFormatter() -> NumberFormatter
    {
        let numberFormatter:NumberFormatter = NumberFormatter()
        numberFormatter.minimumIntegerDigits = VCreateStatusReadyBarStopsFooter.Constants.Formatter.minIntegers
        numberFormatter.maximumFractionDigits = VCreateStatusReadyBarStopsFooter.Constants.Formatter.maxDecimals
        
        return numberFormatter
    }
    
    private class func factoryDistanceSuffixMap() -> [DSettingsDistance:String]
    {
        let suffixMap:[DSettingsDistance:String] = [
            DSettingsDistance.kilometres : String.localizedView(
                key:"VCreateStatusReadyBarStopsFooter_kilometres"),
            DSettingsDistance.miles : String.localizedView(
                key:"VCreateStatusReadyBarStopsFooter_miles")]
        
        return suffixMap
    }
    
    private class func factoryDurationSuffixMap() -> [DPlanTravelDurationType:String]
    {
        let suffixMap:[DPlanTravelDurationType:String] = [
            DPlanTravelDurationType.days : String.localizedView(
                key:"VCreateStatusReadyBarStopsFooter_durationDays"),
            DPlanTravelDurationType.hours : String.localizedView(
                key:"VCreateStatusReadyBarStopsFooter_durationHours"),
            DPlanTravelDurationType.minutes : String.localizedView(
                key:"VCreateStatusReadyBarStopsFooter_durationMinutes"),
            DPlanTravelDurationType.seconds : String.localizedView(
                key:"VCreateStatusReadyBarStopsFooter_durationSeconds")]
        
        return suffixMap
    }
    
    private class func factoryDistanceFormatter(distanceSettings:DSettingsDistance) -> NumberFormatter?
    {
        let suffixes:[DSettingsDistance:String] = factoryDistanceSuffixMap()
        
        guard
            
            let suffix:String = suffixes[distanceSettings]
            
        else
        {
            return nil
        }
        
        let formatter:NumberFormatter = factoryNumberFormatter()
        formatter.positiveSuffix = suffix
        
        return formatter
    }
    
    private class func factoryDurationFormatter(durationType:DPlanTravelDurationType) -> NumberFormatter?
    {
        let suffixes:[DPlanTravelDurationType:String] = factoryDurationSuffixMap()
        
        guard
            
            let suffix:String = suffixes[durationType]
            
        else
        {
            return nil
        }
        
        let formatter:NumberFormatter = factoryNumberFormatter()
        formatter.positiveSuffix = suffix
        
        return formatter
    }
    
    //MARK: internal
    
    class func factoryDistance(
        distance:NSNumber,
        distanceSettings:DSettingsDistance) -> String?
    {
        guard
            
            let formatter:NumberFormatter = factoryDistanceFormatter(distanceSettings:distanceSettings),
            let string:String = formatter.string(from:distance)
            
        else
        {
            return nil
        }
        
        return string
    }
    
    class func factoryDistance(
        model:[DPlanTravel],
        distanceSettings:DSettingsDistance) -> String?
    {
        let distance:Float = DPlanTravel.factoryDistance(
            travels:model,
            distanceSettings:distanceSettings)
        
        let distanceNumber:NSNumber = NSNumber(value:distance)
        
        let string:String? = factoryDistance(
            distance:distanceNumber,
            distanceSettings:distanceSettings)
        
        return String
    }
    
    class func factoryDuration(model:[DPlanTravel]) -> String?
    {
        let duration:DPlanTravelDuration = DPlanTravelDuration.factoryDuration(travels:model)
        let number:NSNumber = NSNumber(value:duration.amount)
        
        guard
            
            let formatter:NumberFormatter = factoryDurationFormatter(durationType:duration.type),
            let string:String = formatter.string(from:number)
            
        else
        {
            return nil
        }
        
        return string
    }
}
