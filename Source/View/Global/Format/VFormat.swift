import Foundation

struct VFormat
{
    //MARK: internal
    
    static func factoryNumberFormatter() -> NumberFormatter
    {
        let numberFormatter:NumberFormatter = NumberFormatter()
        numberFormatter.minimumIntegerDigits = VFormat.Constants.minIntegers
        numberFormatter.maximumFractionDigits = VFormat.Constants.maxDecimals
        
        return numberFormatter
    }
}
