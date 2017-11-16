import Foundation

final class MSettingsMemory:Model<ArchSettingsMemory>
{
    var database:Database?
    var settings:DSettings?
    var items:[MSettingsMemoryItem]
    
    required init()
    {
        items = []
        super.init()
    }
}
