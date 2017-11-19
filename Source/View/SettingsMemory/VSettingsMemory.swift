import UIKit

final class VSettingsMemory:ViewMain
{
    weak var viewSpinner:VSettingsMemorySpinner?
    weak var viewList:VSettingsMemoryList!
    
    override var panBack:Bool
    {
        get
        {
            return true
        }
    }
    
    required init(controller:UIViewController)
    {
        super.init(controller:controller)
        
        guard
        
            let controller:CSettingsMemory = controller as? CSettingsMemory
        
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
    
    deinit
    {
        viewSpinner?.stopAnimating()
    }
}
