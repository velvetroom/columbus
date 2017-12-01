import Foundation

extension MGlobalPlan
{
    static var projectsDirectory:URL?
    {
        get
        {
            var directory:URL = FileManager.default.appDirectory.appendingPathComponent(
                MGlobalPlan.Constants.projectsDirectory)
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
    
    //MARK: internal
    
    static func deleteDirectory(identifier:String)
    {
        guard
            
            let projectsPath:URL = MGlobalPlan.projectsDirectory
            
        else
        {
            return
        }
        
        let project:URL = projectsPath.appendingPathComponent(identifier)
        
        do
        {
            try FileManager.default.removeItem(at:project)
        }
        catch { }
    }
}
