import UIKit

final class VSettingsMemoryConfirm:ViewMain
{
    weak var layoutBaseTop:NSLayoutConstraint!
    
    required init(controller:UIViewController)
    {
        super.init(controller:controller)
        backgroundColor = UIColor.clear
        
        guard
            
            let controller:CSettingsMemoryConfirm = controller as? CSettingsMemoryConfirm
        
        else
        {
            return
        }
        
        factoryViews(controller:controller)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
