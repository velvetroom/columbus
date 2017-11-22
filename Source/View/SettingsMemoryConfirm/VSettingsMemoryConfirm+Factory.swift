import UIKit

extension VSettingsMemoryConfirm
{
    //MARK: internal
    
    func factoryViews(controller:CSettingsMemoryConfirm)
    {
        let blurBase:UIView = UIView()
        blurBase.isUserInteractionEnabled = false
        blurBase.translatesAutoresizingMaskIntoConstraints = false
        blurBase.clipsToBounds = true
        blurBase.alpha = VSettingsMemoryConfirm.Constants.blurAlpha
        
        let blur:VBlur = VBlur.dark()
        
        let buttonCancel:UIButton = UIButton()
        buttonCancel.translatesAutoresizingMaskIntoConstraints = false
        buttonCancel.addTarget(
            self,
            action:#selector(selectorCancel(sender:)),
            for:UIControlEvents.touchUpInside)
        
        let viewBase:VSettingsMemoryConfirmBase = VSettingsMemoryConfirmBase(controller:controller)
        
        blurBase.addSubview(blur)
        addSubview(blurBase)
        addSubview(buttonCancel)
        addSubview(viewBase)
        
        NSLayoutConstraint.equals(
            view:blurBase,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:blur,
            toView:blurBase)
        
        NSLayoutConstraint.equals(
            view:buttonCancel,
            toView:self)
        
        layoutBaseTop = NSLayoutConstraint.topToTop(
            view:viewBase,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBase,
            constant:VSettingsMemoryConfirm.Constants.baseHeight)
        layoutBaseLeft = NSLayoutConstraint.leftToLeft(
            view:viewBase,
            toView:self)
        NSLayoutConstraint.width(
            view:viewBase,
            constant:VSettingsMemoryConfirm.Constants.baseWidth)
    }
}
