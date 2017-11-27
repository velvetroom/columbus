import Foundation

extension VFormat
{
    //MARK: private
    
    private static func factorySuffixMap() -> [DSettingsDistance:String]
    {
        let suffixMap:[DSettingsDistance:String] = [
            DSettingsDistance.kilometres : String.localizedView(key:"VFormat_distanceKilometres"),
            DSettingsDistance.miles : String.localizedView(key:"VFormat_distanceMiles")]
        
        return suffixMap
    }
    
    private static func factoryFormatter(distanceSettings:DSettingsDistance) -> NumberFormatter?
    {
        let suffixes:[DSettingsDistance:String] = factorySuffixMap()
        
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
    
    static func distanceConvert(
        metres:Float,
        distanceSettings:DSettingsDistance) -> Float
    {
        guard
            
            let divisor:Float = VFormat.Constants.distanceConversion[distanceSettings]
            
        else
        {
            return metres
        }
        
        let converted:Float = metres / divisor
        
        return converted
    }
    
    static func factoryDistance(
        distance:Double,
        distanceSettings:DSettingsDistance) -> String?
    {
        let distanceFloat:Float = Float(distance)
        
        let distanceString:String? = factoryDistance(
            distance:distance,
            distanceSettings:distanceSettings)
        
        return distanceString
    }
    
    static func factoryDistance(
        distance:Float,
        distanceSettings:DSettingsDistance) -> String?
    {
        let distance:Float = distanceConvert(
            metres:distance,
            distanceSettings:distanceSettings)
        
        let distanceNumber:NSNumber = NSNumber(value:distance)
        
        guard
            
            let formatter:NumberFormatter = factoryFormatter(distanceSettings:distanceSettings),
            let string:String = formatter.string(from:distanceNumber)
            
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
        let distanceMetres:Float = DPlanTravel.factoryDistance(
            travels:travels)
        let distance:Float = distanceConvert(
            metres:distanceMetres,
            distanceSettings:distanceSettings)
        
        let string:String? = factoryDistance(
            distance:distance,
            distanceSettings:distanceSettings)
        
        return string
    }
}
