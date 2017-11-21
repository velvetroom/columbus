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
    
    private func stringFromValue(
        value:CGFloat,
        suffix:String) -> String?
    {
        let number:NSNumber = value as NSNumber
        
        guard
        
            var string:String = numberFormatter.string(from:number)
        
        else
        {
            return nil
        }
        
        string.append(suffix)
        
        return string
    }
    
    //MARK: internal
    
    func bytesAsGB(bytes:CGFloat) -> String?
    {
        let suffix:String = String.localizedModel(key:"MSettingsMemory_bytesGB")
        let giga:CGFloat = bytesAsGiga(bytes:bytes)
        let string:String? = stringFromValue(
            value:giga,
            suffix:suffix)
        
        return string
    }
    
    func bytesAsRoundedGB(bytes:CGFloat) -> String?
    {
        let suffix:String = String.localizedModel(key:"MSettingsMemory_bytesGB")
        let giga:CGFloat = bytesAsGiga(bytes:bytes)
        let roundedGiga:CGFloat = ceil(giga)
        let string:String? = stringFromValue(
            value:roundedGiga,
            suffix:suffix)
        
        return string
    }
    
    func bytesAsMB(bytes:CGFloat) -> String?
    {
        let suffix:String = String.localizedModel(key:"MSettingsMemory_bytesMB")
        let mega:CGFloat = bytesAsMega(bytes:bytes)
        let string:String? = stringFromValue(
            value:mega,
            suffix:suffix)
        
        return string
    }
}
