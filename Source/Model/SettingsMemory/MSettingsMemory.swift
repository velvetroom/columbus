import Foundation

final class MSettingsMemory:Model<ArchSettingsMemory>
{
    var items:[MSettingsMemoryItem]
    var database:Database?
    var settings:DSettings?
    var system:MSettingsMemorySystem?
    var garbage:MSettingsMemoryProjects?
    
    required init()
    {
        items = []
        super.init()
    }
}
