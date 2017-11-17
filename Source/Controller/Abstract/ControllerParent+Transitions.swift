import UIKit

extension ControllerParent
{
    enum Vertical:CGFloat
    {
        case top = -1
        case bottom = 1
        case none = 0
    }
    
    enum Horizontal:CGFloat
    {
        case left = -1
        case right = 1
        case none = 0
    }
    
    //MARK: private
    
    private func slide(controller:UIViewController, left:CGFloat)
    {
        guard
            
            let view:ViewParent = self.view as? ViewParent,
            let currentController:UIViewController = childViewControllers.last,
            let newView:ViewProtocol = controller.view as? ViewProtocol,
            let currentView:ViewProtocol = currentController.view as? ViewProtocol
            
        else
        {
            return
        }
        
        currentController.removeFromParentViewController()
        
        addChildViewController(controller)
        controller.beginAppearanceTransition(true, animated:true)
        currentController.beginAppearanceTransition(false, animated:true)
        
        view.slide(
            currentView:currentView,
            newView:newView,
            left:left)
        {
            controller.endAppearanceTransition()
            currentController.endAppearanceTransition()
        }
    }
    
    //MARK: internal
    
    func slideTo(horizontal:Horizontal, controller:UIViewController)
    {
        let viewWidth:CGFloat = -view.bounds.maxX
        let left:CGFloat = viewWidth * horizontal.rawValue
        slide(controller:controller, left:left)
    }
    
    func mainController(controller:UIViewController)
    {
        addChildViewController(controller)
        
        guard
            
            let view:ViewParent = self.view as? ViewParent,
            let newView:ViewProtocol = controller.view as? ViewProtocol
            
        else
        {
            return
        }
        
        view.mainView(view:newView)
    }
    
    func push(
        controller:UIViewController,
        horizontal:Horizontal = Horizontal.none,
        vertical:Vertical = Vertical.none,
        background:Bool = true,
        completion:(() -> ())? = nil)
    {
        guard
            
            let view:ViewParent = self.view as? ViewParent,
            let currentController:UIViewController = childViewControllers.last,
            let newView:ViewProtocol = controller.view as? ViewProtocol
            
        else
        {
            return
        }
        
        let width:CGFloat = view.bounds.maxX
        let height:CGFloat = view.bounds.maxY
        let left:CGFloat = width * horizontal.rawValue
        let top:CGFloat = height * vertical.rawValue
        
        addChildViewController(controller)
        controller.beginAppearanceTransition(true, animated:true)
        currentController.beginAppearanceTransition(false, animated:true)
        
        view.push(
            newView:newView,
            left:left,
            top:top,
            background:background)
        {
            controller.endAppearanceTransition()
            currentController.endAppearanceTransition()
            completion?()
        }
    }
    
    func animateOver(controller:UIViewController)
    {
        guard
            
            let view:ViewParent = self.view as? ViewParent,
            let currentController:UIViewController = childViewControllers.last,
            let newView:ViewProtocol = controller.view as? ViewProtocol
            
        else
        {
            return
        }
        
        addChildViewController(controller)
        controller.beginAppearanceTransition(true, animated:true)
        currentController.beginAppearanceTransition(false, animated:true)
        
        view.animateOver(
            newView:newView)
        {
            controller.endAppearanceTransition()
            currentController.endAppearanceTransition()
        }
    }
    
    func centreOver(controller:UIViewController)
    {
        guard
            
            let view:ViewParent = self.view as? ViewParent,
            let currentController:UIViewController = childViewControllers.last,
            let newView:ViewProtocol = controller.view as? ViewProtocol
            
        else
        {
            return
        }
        
        addChildViewController(controller)
        controller.beginAppearanceTransition(true, animated:true)
        currentController.beginAppearanceTransition(false, animated:true)
        
        view.centreOver(newView:newView)
        
        controller.endAppearanceTransition()
        currentController.endAppearanceTransition()
    }
    
    func removeBetweenFirstAndLast()
    {
        var controllers:Int = childViewControllers.count - 1
        
        while controllers > 1
        {
            controllers -= 1
            
            let controller:UIViewController = childViewControllers[controllers]
            controller.beginAppearanceTransition(false, animated:false)
            controller.view.removeFromSuperview()
            controller.endAppearanceTransition()
            controller.removeFromParentViewController()
        }
    }
    
    func removeAllButLast()
    {
        var controllers:Int = childViewControllers.count - 1
        
        while controllers > 0
        {
            controllers -= 1
            
            let controller:UIViewController = childViewControllers[controllers]
            controller.beginAppearanceTransition(false, animated:false)
            controller.view.removeFromSuperview()
            controller.endAppearanceTransition()
            controller.removeFromParentViewController()
        }
    }
    
    func pop(
        horizontal:Horizontal = Horizontal.none,
        vertical:Vertical = Vertical.none,
        completion:(() -> ())? = nil)
    {
        let width:CGFloat = view.bounds.maxX
        let height:CGFloat = view.bounds.maxY
        let left:CGFloat = width * horizontal.rawValue
        let top:CGFloat = height * vertical.rawValue
        let controllers:Int = childViewControllers.count
        
        if controllers > 1
        {
            let currentController:UIViewController = childViewControllers[controllers - 1]
            let previousController:UIViewController = childViewControllers[controllers - 2]
            currentController.removeFromParentViewController()
            
            guard
                
                let view:ViewParent = self.view as? ViewParent,
                let currentView:ViewProtocol = currentController.view as? ViewProtocol
                
            else
            {
                return
            }
            
            currentController.beginAppearanceTransition(false, animated:true)
            previousController.beginAppearanceTransition(true, animated:true)
            
            view.pop(
                currentView:currentView,
                left:left,
                top:top)
            {
                previousController.endAppearanceTransition()
                currentController.endAppearanceTransition()
                
                completion?()
            }
        }
    }
    
    func popSilent(removeIndex:Int)
    {
        let controllers:Int = childViewControllers.count
        
        if controllers > removeIndex
        {
            let removeController:UIViewController = childViewControllers[removeIndex]
            
            guard
                
                let removeView:ViewProtocol = removeController.view as? ViewProtocol
                
            else
            {
                return
            }
            
            removeView.pushBackground?.removeFromSuperview()
            removeController.view.removeFromSuperview()
            removeController.removeFromParentViewController()
        }
    }
    
    func dismissAnimateOver(completion:(() -> ())?)
    {
        guard
            
            let view:ViewParent = self.view as? ViewParent,
            let currentController:UIViewController = childViewControllers.last
            
        else
        {
            return
        }
        
        currentController.removeFromParentViewController()
        
        guard
            
            let previousController:UIViewController = childViewControllers.last
            
        else
        {
            return
        }
        
        currentController.beginAppearanceTransition(false, animated:true)
        previousController.beginAppearanceTransition(true, animated:true)
        
        view.dismissAnimateOver(
            currentView:currentController.view)
        {
            currentController.endAppearanceTransition()
            previousController.endAppearanceTransition()
            
            completion?()
        }
    }
}
