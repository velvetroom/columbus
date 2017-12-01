import UIKit

extension MCreateSave
{
    //MARK: private
    
    private class func fileSave(
        directory:URL,
        name:String,
        image:UIImage) -> URL?
    {
        let path:URL = directory.appendingPathComponent(name)
        
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
    
    private class func fileSave(
        path:URL,
        image:UIImage) throws
    {
        guard
            
            let data:Data = UIImagePNGRepresentation(image)
            
        else
        {
            let error:MError = MError.factoryNoImageData()
            
            throw error
        }
        
        try data.write(
            to:path,
            options:
            Data.WritingOptions.atomicWrite)
    }
    
    //MARK: internal
    
    class func savePicture(
        directory:URL,
        picture:MCreateSavePicture) -> URL?
    {
        let name:String = picture.factoryName()
        
        guard
            
            let url:URL = fileSave(
                directory:directory,
                name:name,
                image:picture.image)
            
        else
        {
            return nil
        }
        
        return url
    }
    
    class func factoryDirectory(plan:DPlan) -> URL?
    {
        guard
            
            let projects:URL = MGlobalPlan.projectsDirectory,
            let name:String = plan.identifier
        
        else
        {
            return nil
        }
        
        var directory:URL = projects.appendingPathComponent(name)
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
