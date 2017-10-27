import UIKit

final class VCreateSave:ViewMain
{
    weak var viewSpinner:VSpinner!
    let kTitleBottom:CGFloat = -150
    let kTitleHeight:CGFloat = 24
    let kButtonHeight:CGFloat = 50
    let kTitleFontSize:CGFloat = 16
    let kButtonFontSize:CGFloat = 16
    
    required init(controller:UIViewController)
    {
        super.init(controller:controller)
        
        guard
        
            let controller:CCreateSave = controller as? CCreateSave
        
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
        viewSpinner.stopAnimating()
    }
}
