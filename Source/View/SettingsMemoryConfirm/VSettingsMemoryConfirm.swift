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
    
    override func layoutSubviews()
    {
        let height:CGFloat = bounds.height
        let remainHeight:CGFloat = height - VSettingsMemoryConfirm.Constants.baseHeight
        let marginTop:CGFloat = remainHeight / 2.0
        layoutBaseTop.constant = marginTop
        
        super.layoutSubviews()
    }
}
