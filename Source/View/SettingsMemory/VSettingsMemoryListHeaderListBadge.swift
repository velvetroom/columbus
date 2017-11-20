import UIKit

final class VSettingsMemoryListHeaderListBadge:View<ArchSettingsMemory>
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
