import Foundation

extension DPlanTravelDuration
{
    private static let kSecondsInDay:TimeInterval = 86400
    private static let kSecondsInHour:TimeInterval = 3600
    private static let kSecondsInMinute:TimeInterval = 60
    
    //MARK: private
    
    private static func factoryTotalDuration(
        travels:[DPlanTravel]) -> TimeInterval
    {
        var duration:TimeInterval = 0
        
        for travel:DPlanTravel in travels
        {
            duration += travel.duration
        }
        
        return duration
    }
    
    private static func factoryDuration(
        totalDuration:TimeInterval) -> DPlanTravelDuration
    {
        let duration:DPlanTravelDuration
        
        if totalDuration > kSecondsInDay
        {
            duration = factoryDays(
                duration:totalDuration)
        }
        else if totalDuration > kSecondsInHour
        {
            duration = factoryHours(
                duration:totalDuration)
        }
        else if totalDuration > kSecondsInMinute
        {
            duration = factoryMinutes(
                duration:totalDuration)
        }
        else
        {
            duration = factorySeconds(
                duration:totalDuration)
        }
        
        return duration
    }
    
    private static func factoryDays(
        duration:TimeInterval) -> DPlanTravelDuration
    {
        let days:TimeInterval = duration / kSecondsInDay
        let model:DPlanTravelDuration = DPlanTravelDuration(
            type:DPlanTravelDurationType.days,
            amount:days)
        
        return model
    }
    
    private static func factoryHours(
        duration:TimeInterval) -> DPlanTravelDuration
    {
        let hours:TimeInterval = duration / kSecondsInHour
        let model:DPlanTravelDuration = DPlanTravelDuration(
            type:DPlanTravelDurationType.hours,
            amount:hours)
        
        return model
    }
    
    private static func factoryMinutes(
        duration:TimeInterval) -> DPlanTravelDuration
    {
        let minutes:TimeInterval = duration / kSecondsInMinute
        let model:DPlanTravelDuration = DPlanTravelDuration(
            type:DPlanTravelDurationType.minutes,
            amount:minutes)
        
        return model
    }
    
    private static func factorySeconds(
        duration:TimeInterval) -> DPlanTravelDuration
    {
        let model:DPlanTravelDuration = DPlanTravelDuration(
            type:DPlanTravelDurationType.seconds,
            amount:duration)
        
        return model
    }
    
    //MARK: internal
    
    static func factoryDuration(
        travels:[DPlanTravel]) -> DPlanTravelDuration
    {
        let totalDuration:TimeInterval = factoryTotalDuration(
            travels:travels)
        let duration:DPlanTravelDuration = factoryDuration(
            totalDuration:totalDuration)
        
        return duration
    }
}
