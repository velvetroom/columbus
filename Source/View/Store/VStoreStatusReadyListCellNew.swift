import UIKit
import StoreKit

final class VStoreStatusReadyListCellNew:VStoreStatusReadyListCellAvailable
{
    private weak var product:SKProduct?
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        factoryViewsCellNew()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func config(
        controller:CStore,
        model:MStorePerkProtocol)
    {
        super.config(
            controller:controller,
            model:model)
        
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
    func selectorPurchase(sender button:UIButton)
    {
        guard
            
            let product:SKProduct = self.product
        
        else
        {
            return
        }
        
        controller?.model.modelKit.purchase(product:product)
    }
    
    @objc
    func selectorRestore(sender button:UIButton)
    {
        controller?.model.modelKit.restorePurchases()
    }
}
