import UIKit

final class VSettingsMemoryListHeaderList:View<ArchSettingsMemory>
{
    required init(controller:CSettingsMemory)
    {
        super.init(controller:controller)
        isUserInteractionEnabled = false
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
