import UIKit

extension MCreateSave
{
    //MARK: private
    
    private class func fileSave(
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
    
    private class func fileSave(
        path:URL,
        image:UIImage) throws
    {
        guard
            
            let data:Data = UIImagePNGRepresentation(
                image)
            
        else
        {
            let error:MError = MError.factoryNoImageData()
            
            throw error
        }
        
        print("data \(data.count)")
        
        try data.write(
            to:path,
            options:
            Data.WritingOptions.atomicWrite)
    }
    
    //MARK: internal
    
    class func savePictures(
        directory:URL,
        pictures:[MCreateSavePicture]) -> [URL]
    {
        var urls:[URL] = []
        
        for picture:MCreateSavePicture in pictures
        {
            let name:String = picture.factoryName()
            
            guard
            
                let url:URL = fileSave(
                    directory:directory,
                    name:name,
                    image:picture.image)
            
            else
            {
                continue
            }
            
            urls.append(url)
        }
        
        return urls
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
