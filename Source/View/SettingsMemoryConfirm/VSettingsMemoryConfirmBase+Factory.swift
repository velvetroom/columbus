import UIKit

extension VSettingsMemoryConfirmBase
{
    //MARK: internal
    
    func factoryViews()
    {
        let viewInfo:VSettingsMemoryConfirmBaseInfo = VSettingsMemoryConfirmBaseInfo(controller:controller)
        
        let buttonDelete:UIButton = UIButton()
        buttonDelete.translatesAutoresizingMaskIntoConstraints = false
        buttonDelete.backgroundColor = UIColor.colourFail
        buttonDelete.setTitleColor(
            UIColor.white,
            for:UIControlState.normal)
        buttonDelete.setTitleColor(
            UIColor(white:1, alpha:0.2),
            for:UIControlState.highlighted)
        buttonDelete.titleLabel!.font = UIFont.regular(
            size:VSettingsMemoryConfirmBase.Constants.buttonFontSize)
        buttonDelete.setTitle(
            String.localizedView(key:"VSettingsMemoryConfirmBase_buttonDelete"),
            for:UIControlState.normal)
        buttonDelete.addTarget(
            self,
            action:#selector(selectorDelete(sender:)),
            for:UIControlEvents.touchUpInside)
        
        let buttonCancel:UIButton = UIButton()
        buttonCancel.translatesAutoresizingMaskIntoConstraints = false
        buttonCancel.setTitleColor(
            UIColor(white:0, alpha:0.5),
            for:UIControlState.normal)
        buttonCancel.setTitleColor(
            UIColor(white:0, alpha:0.2),
            for:UIControlState.highlighted)
        buttonCancel.titleLabel!.font = UIFont.regular(
            size:VSettingsMemoryConfirmBase.Constants.buttonFontSize)
        buttonCancel.setTitle(
            String.localizedView(key:"VSettingsMemoryConfirmBase_buttonCancel"),
            for:UIControlState.normal)
        buttonCancel.addTarget(
            self,
            action:#selector(selectorCancel(sender:)),
            for:UIControlEvents.touchUpInside)
        
        addSubview(viewInfo)
        addSubview(buttonDelete)
        addSubview(buttonCancel)
        
        NSLayoutConstraint.equals(
            view:viewInfo,
            toView:self)
        
        NSLayoutConstraint.bottomToBottom(
            view:buttonDelete,
            toView:self)
        NSLayoutConstraint.height(
            view:buttonDelete,
            constant:VSettingsMemoryConfirmBase.Constants.buttonHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:buttonDelete,
            toView:self)
        
        NSLayoutConstraint.bottomToTop(
            view:buttonCancel,
            toView:buttonDelete)
        NSLayoutConstraint.height(
            view:buttonCancel,
            constant:VSettingsMemoryConfirmBase.Constants.buttonHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:buttonCancel,
            toView:self)
    }
}
