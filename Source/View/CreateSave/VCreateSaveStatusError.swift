import UIKit

final class VCreateSaveStatusError:View<ArchCreateSave>
{
    weak var layoutCancelLeft:NSLayoutConstraint!
    weak var layoutRetryLeft:NSLayoutConstraint!
    let kLabelBottom:CGFloat = -200
    let kLabelHeight:CGFloat = 220
    let kTitleFontSize:CGFloat = 20
    let kDescrFontSize:CGFloat = 14
    let kButtonWidth:CGFloat = 120
    let kButtonHeight:CGFloat = 40
    let kCancelFontSize:CGFloat = 16
    let kRetryFontSize:CGFloat = 18
    let kImageHeight:CGFloat = 80
    
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
