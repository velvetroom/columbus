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
    
    //MARK: internal
    
    static func factorySystem(columbusSize:CGFloat) -> MSettingsMemorySystem
    {
        let systemSize:CGFloat = factorySystemSize()
        let systemFreeSize:CGFloat = factorySystemFreeSize()
        let otherSize:CGFloat = systemSize - systemFreeSize
        let otherPercent:CGFloat = otherSize / systemSize
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
