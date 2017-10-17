import UIKit

extension ViewParent:UIGestureRecognizerDelegate
{
    private typealias Router = (
        (ViewParent) ->
        (CGPoint, CGFloat) -> ())
    
    private static let kRouterMap:[
        UIGestureRecognizerState:Router] = [
            UIGestureRecognizerState.began:gestureStateBegan,
            UIGestureRecognizerState.possible:gestureStateBegan,
            UIGestureRecognizerState.changed:gestureStateChanged,
            UIGestureRecognizerState.cancelled:gestureStateEnded,
            UIGestureRecognizerState.ended:gestureStateEnded,
            UIGestureRecognizerState.failed:gestureStateEnded]
    
    //MARK: selectors
    
    @objc
    private func selectorPanRecognized(sender panGesture:UIPanGestureRecognizer)
    {
        let location:CGPoint = panGesture.location(in:self)
        let xPos:CGFloat = location.x
        
        guard
        
            let router:Router = ViewParent.kRouterMap[
                panGesture.state]
        
        else
        {
            return
        }
        
        router(self)(location, xPos)
    }
    
    //MARK: private
    
    private func gestureStateBegan(
        location:CGPoint,
        xPos:CGFloat)
    {
        if xPos < kMaxXPanning
        {
            self.panningX = xPos
        }
    }
    
    private func gestureStateChanged(
        location:CGPoint,
        xPos:CGFloat)
    {
        guard
        
            let panningX:CGFloat = self.panningX
        
        else
        {
            return
        }
        
        let deltaX:CGFloat = xPos - panningX
        
        guard
        
            deltaX < kMaxXDelta
        
        else
        {
            panRecognizer.isEnabled = false
            
            return
        }
        
        gesturePanTo(deltaX:deltaX)
    }
    
    private func gestureStateEnded(
        location:CGPoint,
        xPos:CGFloat)
    {
        guard
        
            let panningX:CGFloat = self.panningX
        
        else
        {
            self.panningX = nil
            
            return
        }
        
        let deltaX:CGFloat = xPos - panningX
        
        if deltaX > kMinXDelta
        {
            gesturePop()
        }
        else
        {
            gestureRestore()
        }
        
        self.panningX = nil
    }
    
    private func gesturePanTo(
        deltaX:CGFloat)
    {
        var useDeltaX:CGFloat = deltaX
        
        if useDeltaX < 0
        {
            useDeltaX = 0
        }
        
        guard
            
            let topView:ViewMain = subviews.last as? ViewMain
            
        else
        {
            return
        }
        
        topView.layoutLeft.constant = useDeltaX
    }
    
    private func gesturePop()
    {
        panRecognizer.isEnabled = true
        controller.pop(horizontal:ControllerParent.Horizontal.right)
    }
    
    private func gestureRestore()
    {
        panRecognizer.isEnabled = true
        
        guard
            
            let topView:ViewProtocol = subviews.last as? ViewProtocol
            
        else
        {
            return
        }
        
        topView.layoutLeft.constant = 0
        
        UIView.animate(withDuration:kAnimationDuration)
        {
            self.layoutIfNeeded()
        }
    }
    
    //MARK: internal
    
    func factoryGesture()
    {
        let panRecognizer:UIPanGestureRecognizer = UIPanGestureRecognizer(
            target:self,
            action:#selector(selectorPanRecognized(sender:)))
        panRecognizer.delegate = self
        self.panRecognizer = panRecognizer
        
        addGestureRecognizer(panRecognizer)
    }
    
    //MARK: gestureRecognizerDelegate
    
    override func gestureRecognizerShouldBegin(
        _ gestureRecognizer:UIGestureRecognizer) -> Bool
    {
        guard
            
            let view:ViewProtocol = subviews.last as? ViewProtocol
            
        else
        {
            return false
        }
        
        let panBack:Bool = view.panBack
        
        return panBack
    }
}
