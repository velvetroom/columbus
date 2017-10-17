import UIKit

extension ViewParent
{
    func mainView(view:ViewProtocol)
    {
        guard
            
            let ui:UIView = view as? UIView
            
        else
        {
            return
        }
        
        insertSubview(ui, belowSubview:viewMenu)
        
        view.layoutTop = NSLayoutConstraint.topToTop(
            view:ui,
            toView:self)
        view.layoutBottom = NSLayoutConstraint.bottomToBottom(
            view:ui,
            toView:self)
        view.layoutLeft = NSLayoutConstraint.leftToLeft(
            view:ui,
            toView:self)
        view.layoutRight = NSLayoutConstraint.rightToRight(
            view:ui,
            toView:self)
    }
    
    func slide(
        currentView:ViewProtocol,
        newView:ViewProtocol,
        left:CGFloat,
        completion:@escaping(() -> ()))
    {
        guard
            
            let currentUi:UIView = currentView as? UIView,
            let newUi:UIView = newView as? UIView
            
        else
        {
            return
        }
        
        insertSubview(newUi, belowSubview:viewMenu)
        
        newView.layoutTop = NSLayoutConstraint.topToTop(
            view:newUi,
            toView:self)
        newView.layoutBottom = NSLayoutConstraint.bottomToBottom(
            view:newUi,
            toView:self)
        newView.layoutRight = NSLayoutConstraint.rightToRight(
            view:newUi,
            toView:self,
            constant:-left)
        newView.layoutLeft = NSLayoutConstraint.leftToLeft(
            view:newUi,
            toView:self,
            constant:-left)
        
        layoutIfNeeded()
        
        if left >= 0
        {
            currentView.layoutRight.constant = left
            currentView.layoutLeft.constant = left
            newView.layoutRight.constant = 0
            newView.layoutLeft.constant = 0
        }
        else
        {
            currentView.layoutLeft.constant = left
            currentView.layoutRight.constant = left
            newView.layoutLeft.constant = 0
            newView.layoutRight.constant = 0
        }
        
        UIView.animate(
            withDuration:kAnimationDuration,
            animations:
            {
                self.layoutIfNeeded()
        })
        { (done:Bool) in
            
            currentUi.removeFromSuperview()
            completion()
        }
    }
    
    func push(
        newView:ViewProtocol,
        left:CGFloat,
        top:CGFloat,
        background:Bool,
        completion:@escaping(() -> ()))
    {
        if background
        {
            let pushBackground:VPushBackground = VPushBackground()
            newView.pushBackground = pushBackground
            
            addSubview(pushBackground)
            
            NSLayoutConstraint.equals(
                view:pushBackground,
                toView:self)
        }
        
        guard
            
            let newUi:UIView = newView as? UIView
        
        else
        {
            return
        }
        
        addSubview(newUi)
        
        newView.layoutTop = NSLayoutConstraint.topToTop(
            view:newUi,
            toView:self,
            constant:top)
        newView.layoutBottom = NSLayoutConstraint.bottomToBottom(
            view:newUi,
            toView:self,
            constant:top)
        newView.layoutLeft = NSLayoutConstraint.leftToLeft(
            view:newUi,
            toView:self,
            constant:left)
        newView.layoutRight = NSLayoutConstraint.rightToRight(
            view:newUi,
            toView:self,
            constant:left)
        
        layoutIfNeeded()
        
        if top >= 0
        {
            newView.layoutTop.constant = 0
            newView.layoutBottom.constant = 0
        }
        else
        {
            newView.layoutBottom.constant = 0
            newView.layoutTop.constant = 0
        }
        
        if left >= 0
        {
            newView.layoutLeft.constant = 0
            newView.layoutRight.constant = 0
        }
        else
        {
            newView.layoutRight.constant = 0
            newView.layoutLeft.constant = 0
        }
        
        UIView.animate(
            withDuration:kAnimationDuration,
            animations:
            {
                self.layoutIfNeeded()
                newView.pushBackground?.alpha = 1
        })
        { (done:Bool) in
            
            completion()
        }
    }
    
    func animateOver(
        newView:ViewProtocol,
        completion:@escaping(() -> ()))
    {
        guard
            
            let newUi:UIView = newView as? UIView
            
        else
        {
            return
        }
        
        newUi.alpha = 0
        addSubview(newUi)
        
        newView.layoutTop = NSLayoutConstraint.topToTop(
            view:newUi,
            toView:self)
        newView.layoutBottom = NSLayoutConstraint.bottomToBottom(
            view:newUi,
            toView:self)
        newView.layoutLeft = NSLayoutConstraint.leftToLeft(
            view:newUi,
            toView:self)
        newView.layoutRight = NSLayoutConstraint.rightToRight(
            view:newUi,
            toView:self)
        
        layoutIfNeeded()
        completion()
        
        UIView.animate(withDuration:kAnimationDuration)
        { [weak newUi] in
            
            newUi?.alpha = 1
        }
    }
    
    func centreOver(newView:ViewProtocol)
    {
        guard
            
            let newUi:UIView = newView as? UIView
            
        else
        {
            return
        }
        
        addSubview(newUi)
        
        newView.layoutTop = NSLayoutConstraint.topToTop(
            view:newUi,
            toView:self)
        newView.layoutBottom = NSLayoutConstraint.bottomToBottom(
            view:newUi,
            toView:self)
        newView.layoutLeft = NSLayoutConstraint.leftToLeft(
            view:newUi,
            toView:self)
        newView.layoutRight = NSLayoutConstraint.rightToRight(
            view:newUi,
            toView:self)
        
        layoutIfNeeded()
    }
    
    func pop(
        currentView:ViewProtocol,
        left:CGFloat,
        top:CGFloat,
        completion:@escaping(() -> ()))
    {
        guard
            
            let currentUi:UIView = currentView as? UIView
            
        else
        {
            return
        }
        
        currentView.layoutRight.constant = left
        currentView.layoutLeft.constant = left
        
        if top > 0
        {
            currentView.layoutBottom.constant = top
            currentView.layoutTop.constant = top
        }
        else
        {
            currentView.layoutTop.constant = top
            currentView.layoutBottom.constant = top
        }
        
        UIView.animate(
            withDuration:kAnimationDuration,
            animations:
            {
                self.layoutIfNeeded()
                currentView.pushBackground?.alpha = 0
        })
        { (done:Bool) in
            
            currentView.pushBackground?.removeFromSuperview()
            currentUi.removeFromSuperview()
            completion()
        }
    }
    
    func dismissAnimateOver(
        currentView:UIView,
        completion:@escaping(() -> ()))
    {
        UIView.animate(
            withDuration:kAnimationDuration,
            animations:
            { [weak currentView] in
                
                currentView?.alpha = 0
            })
        { [weak currentView] (done:Bool) in
            
            currentView?.removeFromSuperview()
            completion()
        }
    }
}
