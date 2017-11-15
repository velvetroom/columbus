import UIKit

final class VCreateSaveStatusBusy:View<ArchCreateSave>
{
    weak var viewSpinner:VSpinner!
    weak var viewProgress:VCreateSaveStatusBusyProgress!
    weak var layoutCancelLeft:NSLayoutConstraint!
    let kLabelBottom:CGFloat = -120
    let kLabelHeight:CGFloat = 60
    let kLabelFontSize:CGFloat = 16
    let kCancelHeight:CGFloat = 55
    let kCancelWidth:CGFloat = 120
    let kCancelFontSize:CGFloat = 16
    let kProgressHeight:CGFloat = 20
    
    required init(controller:CCreateSave)
    {
        super.init(controller:controller)
        
        factoryViews()
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
        controller.cancel()
    }
}
