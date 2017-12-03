import Foundation

final class MSettingsMemory:Model<ArchSettingsMemory>
{
    var items:[MSettingsMemoryItem]
    var database:Database?
    var settings:DSettings?
    var system:MSettingsMemorySystem?
    var garbage:MSettingsMemoryProjects?
    let numberFormatter:NumberFormatter
    
    required init()
    {
        items = []
        numberFormatter = NumberFormatter()
        numberFormatter.minimumIntegerDigits = MSettingsMemory.Constants.Formatter.minIntegers
        numberFormatter.maximumFractionDigits = MSettingsMemory.Constants.Formatter.maxDecimals
        
        super.init()
    }
}
