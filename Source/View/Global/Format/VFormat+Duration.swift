import Foundation

extension VFormat
{
    //MARK: private
    
    private static func factorySuffixMap() -> [DPlanTravelDurationType:String]
    {
        let suffixMap:[DPlanTravelDurationType:String] = [
            DPlanTravelDurationType.days : String.localizedView(key:"VFormat_durationDays"),
            DPlanTravelDurationType.hours : String.localizedView(key:"VFormat_durationHours"),
            DPlanTravelDurationType.minutes : String.localizedView(key:"VFormat_durationMinutes"),
            DPlanTravelDurationType.seconds : String.localizedView(key:"VFormat_durationSeconds")]
        
        return suffixMap
    }
    
    private static func factoryFormatter(durationType:DPlanTravelDurationType) -> NumberFormatter?
    {
        let suffixes:[DPlanTravelDurationType:String] = factorySuffixMap()
        
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
    
    static func factoryDuration(travels:[DPlanTravel]) -> String?
    {
        let duration:DPlanTravelDuration = DPlanTravelDuration.factoryDuration(travels:travels)
        let number:NSNumber = NSNumber(value:duration.amount)
        
        guard
            
            let formatter:NumberFormatter = factoryFormatter(durationType:duration.type),
            let string:String = formatter.string(from:number)
            
        else
        {
            return nil
        }
        
        return string
    }
}
