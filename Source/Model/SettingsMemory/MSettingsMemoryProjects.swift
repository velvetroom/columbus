import UIKit

final class MSettingsMemoryProjects
{
    private(set) var size:CGFloat
    private var map:[String:MSettingsMemoryProjectsItem]
    
    var identifiers:[String]
    {
        get
        {
            let identifiers:[String] = Array(map.keys)
            
            return identifiers
        }
    }
    
    init()
    {
        map = [:]
        size = 0
    }
    
    //MARK: internal
    
    func add(project:MSettingsMemoryProjectsItem)
    {
        map[project.identifier] = project
        size += project.size
    }
    
    func pop(identifier:String) -> MSettingsMemoryProjectsItem?
    {
        guard
            
            let item:MSettingsMemoryProjectsItem = map.removeValue(forKey:identifier)
        
        else
        {
            return nil
        }
        
        size -= item.size
        
        return item
    }
}
