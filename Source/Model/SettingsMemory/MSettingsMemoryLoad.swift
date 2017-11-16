import UIKit

extension MSettingsMemory
{
    //MARK: private
    
    private func asyncLoad()
    {
        
        
        factoryItems()
    }
    
    private func factoryProjects() -> [String:MSettingsMemoryProject]
    {
        
        let appDirectory:String = FileManager.default.appDirectory.path
        let projects:[String] = FileManager.default.contentsAt(path:appDirectory)
        
        for path:String in projects
        {
            guard
            
                let identifier:String = factoryIdentifier(path:path)
            
            else
            {
                continue
            }
            
            let size:CGFloat = factorySize(path:path)
            let project:MSettingsMemoryProject = MSettingsMemoryProject(
                identifier:identifier,
                size:size)
            
            
        }
    }
    
    private func factoryIdentifier(path:String) -> String?
    {
        let pathSplit:[String] = path.components(separatedBy:kPathSeparator)
        let identifier:String? = pathSplit.last
        
        return identifier
    }
    
    private func factorySize(path:String) -> CGFloat
    {
        let size:UInt64 = FileManager.default.sizeAt(path:path)
        let sizeFloat:CGFloat = CGFloat(size)
        
        return size
    }
    
    private func factorySystem()
    {
        system = MSettingsMemorySystem.factorySystem()
        
        print(system)
    }
    
    private func factoryItems()
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
