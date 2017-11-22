import UIKit

extension VSettingsMemoryConfirmBase
{
    //MARK: internal
    
    func factoryViews()
    {
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
        
        addSubview(buttonDelete)
        
        NSLayoutConstraint.bottomToBottom(
            view:buttonDelete,
            toView:self)
        NSLayoutConstraint.height(
            view:buttonDelete,
            constant:VSettingsMemoryConfirmBase.Constants.buttonHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:buttonDelete,
            toView:self)
    }
}
