import Foundation

struct VFormat
{
    //MARK: private
    
    private static func factoryDistanceSuffixMap() -> [DSettingsDistance:String]
    {
        let suffixMap:[DSettingsDistance:String] = [
            DSettingsDistance.kilometres : String.localizedView(key:"VFormat_distanceKilometres"),
            DSettingsDistance.miles : String.localizedView(key:"VFormat_distanceMiles")]
        
        return suffixMap
    }
    
    private static func factoryDistanceFormatter(distanceSettings:DSettingsDistance) -> NumberFormatter?
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
    
    //MARK: internal
    
    static func factoryDistance(
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
    
    static func factoryDistance(
        travels:[DPlanTravel],
        distanceSettings:DSettingsDistance) -> String?
    {
        let distance:Float = DPlanTravel.factoryDistance(
            travels:travels,
            distanceSettings:distanceSettings)
        
        let distanceNumber:NSNumber = NSNumber(value:distance)
        
        let string:String? = factoryDistance(
            distance:distanceNumber,
            distanceSettings:distanceSettings)
        
        return string
    }
}
