import Foundation

final class MSettingsMemory:Model<ArchSettingsMemory>
{
    var items:[MSettingsMemoryItem]
    var database:Database?
    var settings:DSettings?
    var system:MSettingsMemorySystem?
    
    required init()
    {
        items = []
        super.init()
    }
}
