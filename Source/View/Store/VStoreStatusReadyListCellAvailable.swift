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
        labelPrice.textAlignment = NSTextAlignment.right
        labelPrice.backgroundColor = UIColor.clear
        labelPrice.font = UIFont.regular(size:VStoreStatusReadyListCellAvailable.Constants.priceFontSize)
        labelPrice.textColor = UIColor.colourBackgroundDark
        self.labelPrice = labelPrice
        
        let border:VBorder = VBorder(colour:UIColor.colourBackgroundGray)
        
        addSubview(labelPrice)
        addSubview(border)
        
        NSLayoutConstraint.bottomToBottom(
            view:labelPrice,
            toView:self,
            constant:VStoreStatusReadyListCellAvailable.Constants.priceBottom)
        NSLayoutConstraint.height(
            view:labelPrice,
            constant:VStoreStatusReadyListCellAvailable.Constants.priceHeight)
        NSLayoutConstraint.rightToRight(
            view:labelPrice,
            toView:self,
            constant:VStoreStatusReadyListCellAvailable.Constants.priceRight)
        NSLayoutConstraint.width(
            view:labelPrice,
            constant:VStoreStatusReadyListCellAvailable.Constants.priceWith)
        
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
