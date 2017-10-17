import Foundation

extension FileManager
{
    //MARK: private
    
    private var systemAttributes:[FileAttributeKey:Any]
    {
        get
        {
            let path:String = appDirectory.path
            let attributes:[FileAttributeKey:Any]
            
            do
            {
                try attributes = attributesOfFileSystem(
                    forPath:path)
            }
            catch
            {
                return [:]
            }
            
            return attributes
        }
    }
    
    //MARK: internal
    
    var appDirectory:URL
    {
        get
        {
            let urlsDict:[URL] = urls(
                for:FileManager.SearchPathDirectory.documentDirectory,
                in:FileManager.SearchPathDomainMask.userDomainMask)
            let appDirectory:URL = urlsDict.last!
            
            return appDirectory
        }
    }
    
    var systemSize:UInt64
    {
        guard
        
            let objectSystemSize:NSNumber = systemAttributes[
                FileAttributeKey.systemSize] as? NSNumber
        
        else
        {
            return 0
        }
        
        let systemSize:UInt64 = objectSystemSize.uint64Value
        
        return systemSize
    }
    
    var systemFreeSize:UInt64
    {
        guard
            
            let objectSystemSize:NSNumber = systemAttributes[
                FileAttributeKey.systemFreeSize] as? NSNumber
            
        else
        {
            return 0
        }
        
        let systemSize:UInt64 = objectSystemSize.uint64Value
        
        return systemSize
    }
}
