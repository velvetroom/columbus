import UIKit

final class VHomeReadyToast:UIView
{
    private weak var timer:Timer?
    
    init(message:String)
    {
        super.init(frame:CGRect.zero)
        alpha = 0
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = false
        backgroundColor = UIColor(white:0, alpha:0.9)
        
        factoryMessage(message:message)
        animateShow()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    deinit
    {
        timer?.invalidate()
    }
    
    //MARK: selectors
    
    @objc
    private func selectorTimer(sender timer:Timer)
    {
        timer.invalidate()
        animateHide()
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
    
    private func startTimer()
    {
        timer = Timer.scheduledTimer(
            timeInterval:VHomeReadyToast.Constants.duration,
            target:self,
            selector:#selector(selectorTimer(sender:)),
            userInfo:nil,
            repeats:false)
    }
    
    private func animateShow()
    {
        UIView.animate(withDuration:ViewMain.Constants.animationDuration,
        animations:
        { [weak self] in
            
            self?.alpha = 1
        })
        { [weak self] (done:Bool) in
            
            self?.startTimer()
        }
    }
    
    private func animateHide()
    {
        UIView.animate(withDuration:ViewMain.Constants.animationDuration,
       animations:
        { [weak self] in
            
            self?.alpha = 0
        })
        { [weak self] (done:Bool) in
            
            self?.removeFromSuperview()
        }
    }
}
