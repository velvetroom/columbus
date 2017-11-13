import UIKit

final class VCreateSaveStatusError:View<ArchCreateSave>
{
    weak var layoutCancelLeft:NSLayoutConstraint!
    weak var layoutRetryLeft:NSLayoutConstraint!
    let kLabelBottom:CGFloat = -200
    let kLabelHeight:CGFloat = 60
    let kLabelFontSize:CGFloat = 16
    let kButtonWidth:CGFloat = 120
    let kCancelHeight:CGFloat = 55
    let kCancelFontSize:CGFloat = 16
    let kRetryHeight:CGFloat = 65
    let kRetryFontSize:CGFloat = 18
    
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
        let remainWidth:CGFloat = width - kButtonWidth
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
