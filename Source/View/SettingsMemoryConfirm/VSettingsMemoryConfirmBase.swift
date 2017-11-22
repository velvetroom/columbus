import UIKit

final class VSettingsMemoryConfirmBase:View<ArchSettingsMemoryConfirm>
{
    required init(controller:CSettingsMemoryConfirm)
    {
        super.init(controller:controller)
        backgroundColor = UIColor.white
        layer.cornerRadius = VSettingsMemoryConfirmBase.Constants.cornerRadius
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
