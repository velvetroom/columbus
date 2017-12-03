import UIKit

final class VStoreStatusError:View<ArchStore>
{
    required init(controller:CStore)
    {
        super.init(controller:controller)
        isUserInteractionEnabled = false
        
        factoryMessage()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func factoryMessage()
    {
        guard
            
            let statusError:MStoreStatusError = controller.model.status as? MStoreStatusError
        
        else
        {
            return
        }
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.regular(size:VStoreStatusError.Constants.fontSize)
        label.textColor = UIColor(white:0, alpha:0.5)
        label.text = statusError.error
        
        addSubview(label)
        
        NSLayoutConstraint.equals(
            view:label,
            toView:self,
            margin:VStoreStatusError.Constants.labelMargin)
    }
}
