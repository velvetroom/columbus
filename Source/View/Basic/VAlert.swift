import UIKit

final class VAlert:UIView
{
    private weak var layoutTop:NSLayoutConstraint!
    private weak var timer:Timer?
    
    class func messageFail(message:String)
    {
        VAlert.message(message:message, color:UIColor.colourFail)
    }
    
    class func messageSuccess(message:String)
    {
        VAlert.message(message:message, color:UIColor.colourSuccess)
    }
    
    private class func message(message:String, color:UIColor)
    {
        DispatchQueue.main.async
        {
            asyncMessage(message:message, color:color)
        }
    }
    
    private class func asyncMessage(message:String, color:UIColor)
    {
        let alert:VAlert = VAlert(
            message:message,
            color:color)
        
        let rootView:UIView = UIApplication.shared.keyWindow!.rootViewController!.view
        rootView.addSubview(alert)
        
        alert.layoutTop = NSLayoutConstraint.topToTop(
            view:alert,
            toView:rootView,
            constant:-VAlert.Constants.height)
        NSLayoutConstraint.equalsHorizontal(
            view:alert,
            toView:rootView)
        NSLayoutConstraint.height(
            view:alert,
            constant:VAlert.Constants.height)
        
        rootView.layoutIfNeeded()
        alert.animate(open:true)
    }
    
    private convenience init(message:String, color:UIColor)
    {
        self.init()
        clipsToBounds = true
        backgroundColor = color
        translatesAutoresizingMaskIntoConstraints = false
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.medium(size:VAlert.Constants.fontSize)
        label.textColor = UIColor.white
        label.textAlignment = NSTextAlignment.center
        label.numberOfLines = 0
        label.backgroundColor = UIColor.clear
        label.text = message
        
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.clear
        button.addTarget(
            self,
            action:#selector(selectorActionButton(sender:)),
            for:UIControlEvents.touchUpInside)
        
        addSubview(label)
        addSubview(button)
        
        NSLayoutConstraint.topToTop(
            view:label,
            toView:self,
            constant:VAlert.Constants.labelTop)
        NSLayoutConstraint.bottomToBottom(
            view:label,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:label,
            toView:self,
            margin:VAlert.Constants.labelMargin)
    }
    
    //MARK: selectors
    
    @objc
    private func selectorActionButton(sender button:UIButton)
    {
        button.isUserInteractionEnabled = false
        timer?.invalidate()
        selectorAlertTimeOut(sender:timer)
    }
    
    @objc
    private func selectorAlertTimeOut(sender timer:Timer?)
    {
        timer?.invalidate()
        animate(open:false)
    }
    
    //MARK: private
    
    private func scheduleTimer()
    {
        self.timer = Timer.scheduledTimer(
            timeInterval:VAlert.Constants.timeOut,
            target:self,
            selector:#selector(selectorAlertTimeOut(sender:)),
            userInfo:nil,
            repeats:false)
    }
    
    private func animate(open:Bool)
    {
        if open
        {
            layoutTop.constant = 0
        }
        else
        {
            layoutTop.constant = -VAlert.Constants.height
        }
        
        UIView.animate(withDuration:VAlert.Constants.animationDuration,
            animations:
        { [weak self] in
            
            self?.superview?.layoutIfNeeded()
        })
        { [weak self] (done:Bool) in
        
            if open
            {
                self?.scheduleTimer()
            }
            else
            {
                self?.removeFromSuperview()
            }
        }
    }
}
