import Foundation

extension DPlanTravel
{
    //MARK: internal
    
    class func factoryDistance(travels:[DPlanTravel]) -> Float
    {
        var distance:Float = 0
        
        for travel:DPlanTravel in travels
        {
            distance += travel.distance
        }
        
        return distance
    }
}
