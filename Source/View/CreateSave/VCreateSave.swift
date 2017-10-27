import UIKit

final class VCreateSave:ViewMain
{
    weak var viewSpinner:VSpinner!
    weak var layoutCancelLeft:NSLayoutConstraint!
    let kTitleBottom:CGFloat = -150
    let kTitleHeight:CGFloat = 24
    let kCancelHeight:CGFloat = 50
    let kCancelWidth:CGFloat = 120
    let kTitleFontSize:CGFloat = 16
    let kCancelFontSize:CGFloat = 16
    
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
    
    override func layoutSubviews()
    {
        let width:CGFloat = bounds.width
        let remainWidth:CGFloat = width - kCancelWidth
        let marginLeft:CGFloat = remainWidth / 2.0
        layoutCancelLeft.constant = marginLeft
        
        super.layoutSubviews()
    }
    
    //MARK: selectors
    
    @objc
    func selectorCancel(sender button:UIButton)
    {
        
    }
}
