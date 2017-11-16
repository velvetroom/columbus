import UIKit

final class MSettingsMemoryProjects
{
    private(set) var map:[String:MSettingsMemoryProjectsItem]
    private(set) var size:CGFloat
    
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
}
