import Foundation

extension DPlanTravel
{
    private static let kDistanceConversion:[
        DSettingsDistance:Float] = [
            DSettingsDistance.kilometres:
                1000.0,
            DSettingsDistance.miles:
                1609.34449789256338]
    
    //MARK: private
    
    private class func factoryDistance(
        travels:[DPlanTravel]) -> Float
    {
        var distance:Float = 0
        
        for travel:DPlanTravel in travels
        {
            distance += travel.distance
        }
        
        return distance
    }
    
    private class func convert(
        distance:Float,
        distanceSettings:DSettingsDistance) -> Float
    {
        guard
        
            let divisor:Float = kDistanceConversion[
                distanceSettings]
        
        else
        {
            return distance
        }
        
        let converted:Float = distance / divisor
        
        return converted
    }
    
    //MARK: internal
    
    class func factoryDistance(
        travels:[DPlanTravel],
        distanceSettings:DSettingsDistance) -> Float
    {
        let distanceMetres:Float = factoryDistance(
            travels:travels)
        let distance:Float = convert(
            distance:distanceMetres,
            distanceSettings:distanceSettings)
        
        return distance
    }
}
