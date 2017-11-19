import UIKit

final class VSettingsMemoryListHeaderBar:View<ArchSettingsMemory>
{
    required init(controller:CSettingsMemory)
    {
        super.init(controller:controller)
        isUserInteractionEnabled = false
        backgroundColor = UIColor.colourBackgroundGray
        layer.cornerRadius = VSettingsMemoryListHeaderBar.Constants.cornerRadius
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
