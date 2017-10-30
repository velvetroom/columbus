import Foundation

extension MHome
{
    private static let kTemplate:String = "{x}.{y}.{z}"
    
    //MARK: internal
    
    class func factoryTileTemplate(
        plan:DPlan) -> String?
    {
        guard
            
            let name:String = plan.identifier
            
        else
        {
            return nil
        }
        
        let directory:URL = FileManager.default.appDirectory.appendingPathComponent(
            name)
        let path:URL = directory.appendingPathComponent(kTemplate)
        let pathString:String = path.absoluteString
        
        return pathString
    }
}
