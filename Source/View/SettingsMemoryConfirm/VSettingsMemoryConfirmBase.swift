import UIKit

final class VSettingsMemoryConfirmBase:View<ArchSettingsMemoryConfirm>
{
    required init(controller: A.C)
    {
        super.init(controller:controller)
        backgroundColor = UIColor.white
        
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
