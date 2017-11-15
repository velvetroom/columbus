import UIKit

final class VCreateSaveStatusBusyProgress:View<ArchCreateSave>
{
    required init(controller:CCreateSave)
    {
        super.init(controller:controller)
        isUserInteractionEnabled = false
        backgroundColor = UIColor(white:1, alpha:0.3)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
