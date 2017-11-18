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
        labelPrice.font = UIFont.light(size:kPriceFontSize)
        labelPrice.textColor = UIColor.colourBackgroundDark
        self.labelPrice = labelPrice
        
        addSubview(labelPrice)
        
        NSLayoutConstraint.bottomToBottom(
            view:labelPrice,
            toView:self,
            constant:kPriceBottom)
        NSLayoutConstraint.height(
            view:labelPrice,
            constant:kPriceHeight)
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
