import UIKit

extension MCreateSave
{
    //MARK: private
    
    private class func fileSave(
        path:URL,
        image:UIImage) throws
    {
        guard
            
            let data:Data = UIImagePNGRepresentation(
                image)
            
        else
        {
            let er:LocalizedError = NSError(
            
            throw ""
        }
        
        try data.write(
            to:path,
            options:
            Data.WritingOptions.atomicWrite)
    }
    
    //MARK: internal
    
    class func fileSave(
        directory:URL,
        name:String,
        image:UIImage) -> URL?
    {
        let path:URL = directory.appendingPathComponent(
            name)
        
        do
        {
            try fileSave(
                path:path,
                image:image)
        }
        catch
        {
            return nil
        }
        
        return path
    }
    
    class func factoryDirectory(
        plan:DPlan) -> URL?
    {
        guard
            
            let name:String = plan.identifier
        
        else
        {
            return nil
        }
        
        var directory:URL = FileManager.default.appDirectory.appendingPathComponent(
            name)
        directory.excludeFromBackup()
        
        do
        {
            try FileManager.default.createDirectory(
                at:directory,
                withIntermediateDirectories:true,
                attributes:nil)
        }
        catch
        {
            return nil
        }
        
        return directory
    }
}
