import UIKit

final class VSettingsMemoryListHeaderListBadge:View<ArchSettingsMemory>
{
    required init(controller:CSettingsMemory)
    {
        super.init(controller:controller)
        isUserInteractionEnabled = false
        layer.cornerRadius = VSettingsMemoryListHeaderListBadge.Constants.cornerRadius
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
