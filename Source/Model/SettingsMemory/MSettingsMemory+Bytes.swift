import UIKit

extension MSettingsMemory
{
    //MARK: private
    
    private func bytesAsMega(bytes:CGFloat) -> CGFloat
    {
        let kilo:CGFloat = bytes / MSettingsMemory.Constants.Numeric.divider
        let mega:CGFloat = kilo / MSettingsMemory.Constants.Numeric.divider
        
        return mega
    }
    
    private func bytesAsGiga(bytes:CGFloat) -> CGFloat
    {
        let mega:CGFloat = bytesAsMega(bytes:bytes)
        let giga:CGFloat = mega / MSettingsMemory.Constants.Numeric.divider
        
        return giga
    }
    
    private func stringFromValue(value:CGFloat) -> String?
    {
        let number:NSNumber = value as NSNumber
        let string:String? = numberFormatter.string(from:number)
        
        return string
    }
    
    //MARK: internal
    
    func bytesAsGB(bytes:CGFloat) -> String?
    {
        let giga:CGFloat = bytesAsGiga(bytes:bytes)
        let string:String? = stringFromValue(value:giga)
        
        return string
    }
    
    func bytesAsRoundedGB(bytes:CGFloat) -> String?
    {
        let giga:CGFloat = bytesAsGiga(bytes:bytes)
        let roundedGiga:CGFloat = ceil(giga)
        let string:String? = stringFromValue(value:roundedGiga)
        
        return string
    }
    
    func bytesAsMB(bytes:CGFloat) -> String?
    {
        let mega:CGFloat = bytesAsMega(bytes:bytes)
        let string:String? = stringFromValue(value:mega)
        
        return string
    }
}
