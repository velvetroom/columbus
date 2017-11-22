import UIKit

extension VSettingsMemoryConfirm
{
    //MARK: internal
    
    func factoryViews(controller:CSettingsMemoryConfirm)
    {
        let blur:VBlur = VBlur.dark()
        
        let viewBase:VSettingsMemoryConfirmBase = VSettingsMemoryConfirmBase(controller:controller)
        
        addSubview(blur)
        addSubview(viewBase)
        
        NSLayoutConstraint.equals(
            view:blur,
            toView:self)
        
        layoutTop = NSLayoutConstraint.topToTop(
            view:viewBase,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBase,
            constant:VSettingsMemoryConfirm.Constants.baseHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBase,
            toView:self,
            margin:VSettingsMemoryConfirm.Constants.baseMarginHorizontal)
    }
}
