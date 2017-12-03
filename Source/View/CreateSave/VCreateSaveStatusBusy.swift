import UIKit

final class VCreateSaveStatusBusy:View<ArchCreateSave>
{
    weak var viewSpinner:VSpinner!
    weak var viewProgress:VCreateSaveStatusBusyProgress!
    weak var layoutCancelLeft:NSLayoutConstraint!
    
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
        let remainWidth:CGFloat = width - VCreateSaveStatusBusy.Constants.cancelWidth
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
