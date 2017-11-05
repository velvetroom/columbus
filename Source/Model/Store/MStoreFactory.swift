import Foundation

extension MStore
{
    //MARK: internal
    
    class func factoryPriceFormatter() -> NumberFormatter
    {
        let formatter:NumberFormatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.currencyISOCode
        
        return formatter
    }
}
