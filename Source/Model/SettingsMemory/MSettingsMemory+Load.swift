import UIKit

extension MSettingsMemory
{
    //MARK: private
    
    private func asyncLoad()
    {
        let projects:MSettingsMemoryProjects = factoryProjects()
        system = MSettingsMemorySystem.factorySystem(columbusSize:projects.size)
        
        factoryItems(projects:projects)
    }
    
    private func factoryProjects() -> MSettingsMemoryProjects
    {
        let projects:MSettingsMemoryProjects = MSettingsMemoryProjects()
        
        guard
            
            let projectsDirectory:URL = MCreateSave.projectsDirectory()
        
        else
        {
            return projects
        }
        
        let projectsList:[URL] = FileManager.default.urlsInDirectory(url:projectsDirectory)
        
        for projectURL:URL in projectsList
        {
            guard

                let identifier:String = factoryIdentifier(url:projectURL)

            else
            {
                continue
            }

            let size:CGFloat = factorySize(url:projectURL)
            let project:MSettingsMemoryProjectsItem = MSettingsMemoryProjectsItem(
                identifier:identifier,
                size:size)

            projects.add(project:project)
        }
        
        return projects
    }
    
    private func factoryIdentifier(url:URL) -> String?
    {
        let pathSplit:[String] = url.path.components(separatedBy:"/")
        let identifier:String? = pathSplit.last
        
        return identifier
    }
    
    private func factorySize(url:URL) -> CGFloat
    {
        let size:UInt64 = FileManager.default.sizeAt(url:url)
        let sizeFloat:CGFloat = CGFloat(size)
        
        return sizeFloat
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
