import Foundation

final class MSettingsMemory:Model<ArchSettingsMemory>
{
    var items:[MSettingsMemoryItem]
    var database:Database?
    var settings:DSettings?
    var system:MSettingsMemorySystem?
    let kPathSeparator:String = "/"
    
    required init()
    {
        items = []
        super.init()
    }
}
