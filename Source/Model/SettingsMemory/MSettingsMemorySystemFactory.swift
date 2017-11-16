import UIKit

extension MSettingsMemorySystem
{
    //MARK: private
    
    private static func factorySystemSize() -> CGFloat
    {
        let systemSize:UInt64 = FileManager.default.systemSize
        let floatSystemSize:CGFloat = CGFloat(systemSize)
        
        return floatSystemSize
    }
    
    private static func factorySystemFreeSize() -> CGFloat
    {
        let systemFreeSize:UInt64 = FileManager.default.systemFreeSize
        let floatSystemFreeSize:CGFloat = CGFloat(systemFreeSize)
        
        return floatSystemFreeSize
    }
    
    private static func factoryColumbusSize() -> CGFloat
    {
        let columbusPath:String = FileManager.default.appDirectory.path
        let attributes:[FileAttributeKey:Any]
        
        do
        {
            try attributes = FileManager.default.attributesOfItem(atPath:columbusPath)
        }
        catch
        {
            return 0
        }
        
        guard
        
            let sizeNumber:NSNumber = attributes[FileAttributeKey.size] as? NSNumber
        
        else
        {
            return 0
        }
        
        let sizeUnsigned:UInt64 = sizeNumber.uint64Value
        let size:CGFloat = CGFloat(sizeUnsigned)
        
        return size
    }
    
    //MARK: internal
    
    static func factorySystem() -> MSettingsMemorySystem
    {
        let systemSize:CGFloat = factorySystemSize()
        let systemFreeSize:CGFloat = factorySystemFreeSize()
        let otherSize:CGFloat = systemSize - systemFreeSize
        let otherPercent:CGFloat = otherSize / systemSize
        let columbusSize:CGFloat = factoryColumbusSize()
        let columbusPercent:CGFloat = columbusSize / systemSize
        
        let system:MSettingsMemorySystem = MSettingsMemorySystem(
            systemSize:systemSize,
            columbusSize:columbusSize,
            columbusPercent:columbusPercent,
            otherSize:otherSize,
            otherPercent:otherPercent)
        
        return system
    }
}
