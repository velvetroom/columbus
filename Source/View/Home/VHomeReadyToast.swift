import UIKit

final class VHomeReadyToast:UIView
{
    private weak var timer:Timer?
    
    init(message:String)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = false
        backgroundColor = UIColor(white:0, alpha:0.9)
        
        factoryMessage(message:message)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    deinit
    {
        timer?.invalidate()
    }
    
    //MARK: private
    
    private func factoryMessage(message:String)
    {
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.center
        label.textColor = UIColor.white
        label.font = UIFont.regular(size:VHomeReadyToast.Constants.fontSize)
        label.text = message
        
        addSubview(label)
        
        NSLayoutConstraint.equals(
            view:label,
            toView:self)
    }
}
