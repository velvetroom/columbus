import UIKit

final class VStoreStatusReadyListCellMessage:VStoreStatusReadyListCellAvailable
{
    private weak var label:UILabel!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        isUserInteractionEnabled = false
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = NSTextAlignment.center
        label.backgroundColor = UIColor.clear
        label.font = UIFont.regular(size:VStoreStatusReadyListCellMessage.Constants.labelFontSize)
        label.textColor = UIColor(white:0, alpha:0.4)
        self.label = label
        
        addSubview(label)
        
        NSLayoutConstraint.bottomToBottom(
            view:label,
            toView:self)
        NSLayoutConstraint.height(
            view:label,
            constant:VStoreStatusReadyListCellMessage.Constants.labelHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:label,
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
        super.config(
            controller:controller,
            model:model)
        
        guard
            
            let status:MStorePerkStatusAvailableMessageProtocol = model.status as? MStorePerkStatusAvailableMessageProtocol
            
        else
        {
            return
        }
        
        label.text = status.message
    }
}
