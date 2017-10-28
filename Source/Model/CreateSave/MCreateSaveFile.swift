import Foundation

extension MCreateSave
{
    //MARK: internal
    
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
