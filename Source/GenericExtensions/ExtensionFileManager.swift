import Foundation

extension FileManager
{
    //MARK: private
    
    private var systemAttributes:[FileAttributeKey:Any]?
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
                return nil
            }
            
            return attributes
        }
    }
    
    private func sizeOfItems(path:String) -> UInt64
    {
        var size:UInt64 = 0
        /*let contents:[String] = contentsAt(path:path)
        
        for path:String in contents
        {
            let itemSize:UInt64 = sizeAt(path:path)
            size += itemSize
        }*/
        
        return size
    }
    
    private func sizeOfItem(path:String) -> UInt64
    {
        let attributes:[FileAttributeKey:Any]
        
        do
        {
            try attributes = attributesOfItem(atPath:path)
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
        
        let size:UInt64 = sizeNumber.uint64Value
        
        return size
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
        
            let objectSystemSize:NSNumber = systemAttributes?[
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
            
            let objectSystemSize:NSNumber = systemAttributes?[
                FileAttributeKey.systemFreeSize] as? NSNumber
            
        else
        {
            return 0
        }
        
        let systemSize:UInt64 = objectSystemSize.uint64Value
        
        return systemSize
    }
    
    func sizeAt(path:String) -> UInt64
    {
        var isDirectory:ObjCBool = false
        
        guard
            
            fileExists(atPath:path, isDirectory:&isDirectory)
            
        else
        {
            return 0
        }
        
        var size:UInt64 = sizeOfItem(path:path)
        
        guard
            
            isDirectory.boolValue
            
        else
        {
            return size
        }
        
        let itemsSize:UInt64 = sizeOfItems(path:path)
        size += itemsSize
        
        return size
    }
    
    func urlsInDirectory(url:URL) -> [URL]
    {
        let contents:[String]
        var urls:[URL] = []
        
        do
        {
            try contents = contentsOfDirectory(atPath:url.path)
        }
        catch
        {
            return []
        }
        
        for path:String in contents
        {
            let url:URL = url.appendingPathComponent(path)
            urls.append(url)
        }
        
        return urls
    }
}
