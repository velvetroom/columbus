import UIKit

final class VSettingsMemoryConfirmBaseInfo:View<ArchSettingsMemoryConfirm>
{
    required init(controller:CSettingsMemoryConfirm)
    {
        super.init(controller:controller)
        isUserInteractionEnabled = false
        
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
