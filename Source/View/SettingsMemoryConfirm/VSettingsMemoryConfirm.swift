import UIKit

final class VSettingsMemoryConfirm:ViewMain
{
    weak var layoutBaseTop:NSLayoutConstraint!
    weak var layoutBaseLeft:NSLayoutConstraint!
    
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
        let width:CGFloat = bounds.width
        let height:CGFloat = bounds.height
        let remainHeight:CGFloat = height - VSettingsMemoryConfirm.Constants.baseHeight
        let remainWidth:CGFloat = width - VSettingsMemoryConfirm.Constants.baseWidth
        let marginTop:CGFloat = remainHeight / 2.0
        let marginLeft:CGFloat = remainWidth / 2.0
        layoutBaseTop.constant = marginTop
        layoutBaseLeft.constant = marginLeft
        
        super.layoutSubviews()
    }
    
    //MARK: selectors
    @objc
    func selectorCancel(sender button:UIButton)
    {
        guard
        
            let controller:CSettingsMemoryConfirm = self.controller as? CSettingsMemoryConfirm
        
        else
        {
            return
        }
        
        controller.cancel()
    }
}
