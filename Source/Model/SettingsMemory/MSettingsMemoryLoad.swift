import UIKit

extension MSettingsMemory
{
    //MARK: private
    
    private func asyncLoad()
    {
        let projects:MSettingsMemoryProjects = factoryProjects()
        
        factorySystem(projects:projects)
        factoryItems(projects:projects)
    }
    
    private func factoryProjects() -> MSettingsMemoryProjects
    {
        let projects:MSettingsMemoryProjects = MSettingsMemoryProjects()
        let appDirectory:String = FileManager.default.appDirectory.path
        /*let paths:[String] = FileManager.default.contentsAt(path:appDirectory)
        
        for path:String in paths
        {
            guard
            
                let identifier:String = factoryIdentifier(path:path)
            
            else
            {
                continue
            }
            
            let size:CGFloat = factorySize(path:path)
            let project:MSettingsMemoryProjectsItem = MSettingsMemoryProjectsItem(
                identifier:identifier,
                size:size)
            
            projects.add(project:project)
        }*/
        
        return projects
    }
    
    private func factoryIdentifier(path:String) -> String?
    {
        let pathSplit:[String] = path.components(separatedBy:"/")
        let identifier:String? = pathSplit.last
        
        return identifier
    }
    
    private func factorySize(path:String) -> CGFloat
    {
        let size:UInt64 = FileManager.default.sizeAt(path:path)
        let sizeFloat:CGFloat = CGFloat(size)
        
        return sizeFloat
    }
    
    private func factorySystem(projects:MSettingsMemoryProjects)
    {
        system = MSettingsMemorySystem.factorySystem(columbusSize:projects.size)
        
        print(system)
    }
    
    private func factoryItems(projects:MSettingsMemoryProjects)
    {
        
    }
    
    //MARK: internal
    
    func load()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncLoad()
        }
    }
}
