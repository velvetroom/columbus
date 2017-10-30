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
        
        var template:String = String()
        template.append(directory.absoluteString)
        template.append(kTemplate)
        
        return template
    }
}
