import UIKit

final class VSettingsMemoryConfirmBase:View<ArchSettingsMemoryConfirm>
{
    required init(controller:CSettingsMemoryConfirm)
    {
        super.init(controller:controller)
        backgroundColor = UIColor.white
        
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
