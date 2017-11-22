import UIKit

extension VStoreStatusReadyListCellNew
{
    //MARK: internal
    
    func factoryViewsCellNew()
    {
        let buttonPurchase:UIButton = UIButton()
        buttonPurchase.translatesAutoresizingMaskIntoConstraints = false
        buttonPurchase.setTitleColor(
            UIColor.colourSuccess,
            for:UIControlState.normal)
        buttonPurchase.setTitleColor(
            UIColor.colourSuccess,
            for:UIControlState.highlighted)
        buttonPurchase.titleLabel!.font = UIFont.bold(
            size:VStoreStatusReadyListCellNew.Constants.buttonFontSize)
        buttonPurchase.setTitle(
            String.localizedView(key:"VStoreStatusReadyListCellNew_buttonPurchase"),
            for:UIControlState.normal)
        buttonPurchase.addTarget(
            self,
            action:#selector(selectorPurchase(sender:)),
            for:UIControlEvents.touchUpInside)
        
        let buttonRestore:UIButton = UIButton()
        buttonRestore.translatesAutoresizingMaskIntoConstraints = false
        buttonRestore.setTitleColor(
            UIColor.colourFail,
            for:UIControlState.normal)
        buttonRestore.setTitleColor(
            UIColor.colourBackgroundDark,
            for:UIControlState.highlighted)
        buttonRestore.titleLabel!.font = UIFont.bold(
            size:VStoreStatusReadyListCellNew.Constants.buttonFontSize)
        buttonRestore.setTitle(
            String.localizedView(key:"VStoreStatusReadyListCellNew_buttonRestore"),
            for:UIControlState.normal)
        buttonRestore.addTarget(
            self,
            action:#selector(selectorRestore(sender:)),
            for:UIControlEvents.touchUpInside)
        
        let border:VBorder = VBorder(colour:UIColor.colourBackgroundGray)
        
        addSubview(border)
        addSubview(buttonPurchase)
        addSubview(buttonRestore)
        
        NSLayoutConstraint.bottomToBottom(
            view:border,
            toView:self,
            constant:-VStoreStatusReadyListCellNew.Constants.buttonHeight)
        NSLayoutConstraint.height(
            view:border,
            constant:ViewMain.Constants.borderWidth)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
        
        NSLayoutConstraint.bottomToBottom(
            view:buttonRestore,
            toView:self)
        NSLayoutConstraint.height(
            view:buttonRestore,
            constant:VStoreStatusReadyListCellNew.Constants.buttonHeight)
        NSLayoutConstraint.width(
            view:buttonRestore,
            constant:VStoreStatusReadyListCellNew.Constants.buttonWidth)
        NSLayoutConstraint.leftToLeft(
            view:buttonRestore,
            toView:self)
        
        NSLayoutConstraint.bottomToBottom(
            view:buttonPurchase,
            toView:self)
        NSLayoutConstraint.height(
            view:buttonPurchase,
            constant:VStoreStatusReadyListCellNew.Constants.buttonHeight)
        NSLayoutConstraint.width(
            view:buttonPurchase,
            constant:VStoreStatusReadyListCellNew.Constants.buttonWidth)
        NSLayoutConstraint.rightToRight(
            view:buttonPurchase,
            toView:self)
    }
}
