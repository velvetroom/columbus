import UIKit
import StoreKit

final class VStoreStatusReadyListCellNew:VStoreStatusReadyListCellAvailable
{
    private weak var product:SKProduct?
    private let kButtonFontSize:CGFloat = 16
    private let kButtonHeight:CGFloat = 50
    private let kButtonWidth:CGFloat = 110
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        let buttonPurchase:UIButton = UIButton()
        buttonPurchase.translatesAutoresizingMaskIntoConstraints = false
        buttonPurchase.setTitleColor(
            UIColor.colourBackgroundDark,
            for:UIControlState.normal)
        buttonPurchase.setTitleColor(
            UIColor.colourSuccess,
            for:UIControlState.highlighted)
        buttonPurchase.titleLabel!.font = UIFont.bold(
            size:kButtonFontSize)
        buttonPurchase.setTitle(
            String.localizedView(
                key:"VStoreStatusReadyListCellNew_buttonPurchase"),
            for:UIControlState.normal)
        
        let buttonRestore:UIButton = UIButton()
        buttonRestore.translatesAutoresizingMaskIntoConstraints = false
        buttonRestore.setTitleColor(
            UIColor.colourFail,
            for:UIControlState.normal)
        buttonRestore.setTitleColor(
            UIColor.colourBackgroundDark,
            for:UIControlState.highlighted)
        buttonRestore.titleLabel!.font = UIFont.bold(
            size:kButtonFontSize)
        buttonRestore.setTitle(
            String.localizedView(
                key:"VStoreStatusReadyListCellNew_buttonRestore"),
            for:UIControlState.normal)
        
        addSubview(buttonPurchase)
        addSubview(buttonRestore)
        
        NSLayoutConstraint.bottomToBottom(
            view:buttonRestore,
            toView:self)
        NSLayoutConstraint.height(
            view:buttonRestore,
            constant:kButtonHeight)
        NSLayoutConstraint.width(
            view:buttonRestore,
            constant:kButtonWidth)
        NSLayoutConstraint.leftToLeft(
            view:buttonRestore,
            toView:self)
        
        NSLayoutConstraint.bottomToBottom(
            view:buttonPurchase,
            toView:self)
        NSLayoutConstraint.height(
            view:buttonPurchase,
            constant:kButtonHeight)
        NSLayoutConstraint.width(
            view:buttonPurchase,
            constant:kButtonWidth)
        NSLayoutConstraint.rightToRight(
            view:buttonPurchase,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func config(
        controller:CStore,
        model:MStorePerkProtocol)
    {
        guard
        
            let status:MStorePerkStatusNew = model.status as? MStorePerkStatusNew
        
        else
        {
            return
        }
        
        product = status.product
    }
    
    //MARK: selectors
    
    @objc
    private func selectorPurchase(sender button:UIButton)
    {
        guard
            
            let product:SKProduct = self.product
        
        else
        {
            return
        }
        
        controller?.model.modelKit.purchase(
            product:product)
    }
    
    @objc
    private func selectorRestore(sender button:UIButton)
    {
        controller?.model.modelKit.restorePurchases()
    }
}
