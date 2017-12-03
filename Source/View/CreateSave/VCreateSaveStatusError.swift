import UIKit

final class VCreateSaveStatusError:View<ArchCreateSave>
{
    weak var layoutCancelLeft:NSLayoutConstraint!
    weak var layoutRetryLeft:NSLayoutConstraint!
    
    required init(controller:CCreateSave)
    {
        super.init(controller:controller)
        
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = bounds.width
        let remainWidth:CGFloat = width - VCreateSaveStatusError.Constants.buttonWidth
        let marginLeft:CGFloat = remainWidth / 2.0
        layoutCancelLeft.constant = marginLeft
        layoutRetryLeft.constant = marginLeft
        
        super.layoutSubviews()
    }
    
    //MARK: selectors
    
    @objc
    func selectorCancel(sender button:UIButton)
    {
        controller.cancel()
    }
    
    @objc
    func selectorRetry(sender button:UIButton)
    {
        controller.model.retryBuilding()
    }
}
