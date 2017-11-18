import UIKit

class VStoreStatusReadyListCellAvailable:VStoreStatusReadyListCell
{
    private weak var labelPrice:UILabel!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        let labelPrice:UILabel = UILabel()
        labelPrice.isUserInteractionEnabled = false
        labelPrice.translatesAutoresizingMaskIntoConstraints = false
        labelPrice.textAlignment = NSTextAlignment.center
        labelPrice.backgroundColor = UIColor.clear
        labelPrice.font = UIFont.light(size:VStoreStatusReadyListCellAvailable.Constants.priceFontSize)
        labelPrice.textColor = UIColor.colourBackgroundDark
        self.labelPrice = labelPrice
        
        addSubview(labelPrice)
        
        NSLayoutConstraint.bottomToBottom(
            view:labelPrice,
            toView:self,
            constant:VStoreStatusReadyListCellAvailable.Constants.priceBottom)
        NSLayoutConstraint.height(
            view:labelPrice,
            constant:VStoreStatusReadyListCellAvailable.Constants.priceHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:labelPrice,
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
        super.config(controller:controller, model:model)
        
        guard
            
            let status:MStorePerkStatusAvailableProtocol = model.status as? MStorePerkStatusAvailableProtocol
        
        else
        {
            return
        }
        
        labelPrice.text = status.price
    }
}
