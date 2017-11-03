import Foundation

extension DPlanTravel
{
    //MARK: internal
    
    class func factoryDuration(
        travels:[DPlanTravel]) -> TimeInterval
    {
        var duration:TimeInterval = 0
        
        for travel:DPlanTravel in travels
        {
            duration += travel.duration
        }
        
        return duration
    }
}
