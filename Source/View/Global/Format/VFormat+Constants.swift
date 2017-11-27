import Foundation

extension VFormat
{
    struct Constants
    {
        static let distanceConversion:[DSettingsDistance:Float] = [
            DSettingsDistance.kilometres : 1000.0,
            DSettingsDistance.miles : 1609.34449789256338]
        
        static let minIntegers:Int = 1
        static let maxDecimals:Int = 1
    }
}
