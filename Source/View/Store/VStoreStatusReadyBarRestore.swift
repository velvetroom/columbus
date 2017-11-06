import UIKit

final class VStoreStatusReadyBarRestore:View<ArchStore>
{
    private let kFontSize:CGFloat = 14
    
    required init(controller:CStore)
    {
        super.init(controller:controller)
        
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(
            UIColor.colourBackgroundDark,
            for:UIControlState.normal)
        button.setTitleColor(
            UIColor.colourBackgroundGray,
            for:UIControlState.highlighted)
        button.titleLabel!.font = UIFont.bold(
            size:kFontSize)
        button.setTitle(
            String.localizedView(key:
                "VStoreStatusReadyBarRestore_button"),
            for:UIControlState.normal)
        button.addTarget(
            self,
            action:#selector(selectorRestore(sender:)),
            for:UIControlEvents.touchUpInside)
        
        addSubview(button)
        
        NSLayoutConstraint.equals(
            view:button,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: selectors
    
    @objc
    private func selectorRestore(sender button:UIButton)
    {
        controller.model.modelKit.restorePurchases()
    }
}
