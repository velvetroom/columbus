import Foundation

extension MHome
{
    //MARK: internal
    
    class func factoryTileTemplate(plan:DPlan) -> String?
    {
        guard
            
            let name:String = plan.identifier,
            let projects:URL = MGlobalPlan.projectsDirectory
            
        else
        {
            return nil
        }
        
        let directory:URL = projects.appendingPathComponent(name)
        
        var template:String = String()
        template.append(directory.absoluteString)
        template.append(MHome.Constants.Tile.template)
        
        return template
    }
    
    class func factoryInfo() -> [MHomeInfoProtocol]
    {
        let itemSettings:MHomeInfoSettings = MHomeInfoSettings()
        let itemStore:MHomeInfoStore = MHomeInfoStore()
        let itemHome:MHomeInfoHome = MHomeInfoHome()
        let itemCreate:MHomeInfoCreate = MHomeInfoCreate()
        let itemPlans:MHomeInfoPlans = MHomeInfoPlans()
        
        let items:[MHomeInfoProtocol] = [
            itemSettings,
            itemStore,
            itemHome,
            itemCreate,
            itemPlans]
        
        return items
    }
}
