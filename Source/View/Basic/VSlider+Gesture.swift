import UIKit

extension VSlider:UIGestureRecognizerDelegate
{
    private typealias Router = (
        (VSlider) ->
        (UIPanGestureRecognizer) -> ())
    
    private static let kRouterMap:[
        UIGestureRecognizerState:Router] = [
            UIGestureRecognizerState.began:gestureBegan,
            UIGestureRecognizerState.changed:gestureChanged,
            UIGestureRecognizerState.ended:gestureEnded,
            UIGestureRecognizerState.failed:gestureEnded,
            UIGestureRecognizerState.cancelled:gestureEnded]
    
    //MARK: selectors
    
    @objc
    private func selectorPanning(
        sender gesture:UIPanGestureRecognizer)
    {
        guard
        
            let router:Router = VSlider.kRouterMap[
                gesture.state]
        
        else
        {
            return
        }
        
        router(self)(gesture)
    }
    
    //MARK: private
    
    private func gestureBegan(gesture:UIPanGestureRecognizer)
    {
        panInitialWidth = layoutBarWidth.constant
    }
    
    private func gestureChanged(gesture:UIPanGestureRecognizer)
    {
        let totalWidth:CGFloat = viewBase.bounds.maxX
        
        guard
            
            let panInitialWidth:CGFloat = self.panInitialWidth,
            totalWidth > 0
            
        else
        {
            return
        }
        
        let translationX:CGFloat = gesture.translation(in:self).x
        var newWidth:CGFloat = panInitialWidth + translationX
        
        if newWidth < 0
        {
            newWidth = 0
        }
        else if newWidth > totalWidth
        {
            newWidth = totalWidth
        }
        
        updateBar(
            newWidth:newWidth,
            totalWidth:totalWidth)
    }
    
    private func gestureEnded(gesture:UIPanGestureRecognizer)
    {
        panInitialWidth = nil
        slidingFinished?()
    }
    
    private func updateBar(
        newWidth:CGFloat,
        totalWidth:CGFloat)
    {
        layoutBarWidth.constant = newWidth
        let percentUsed:CGFloat = newWidth / totalWidth
        self.percentUsed = percentUsed
        
        DispatchQueue.global(
            qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.sliderChange?(percentUsed)
        }
    }
    
    //MARK: internal
    
    func factoryGestureRecognizer() -> UIPanGestureRecognizer
    {
        let gesture:UIPanGestureRecognizer = UIPanGestureRecognizer(
            target:self,
            action:#selector(selectorPanning(sender:)))
        gesture.delegate = self
        
        return gesture
    }
    
    //MARK: gestureRecognizer delegate
    
    override func gestureRecognizerShouldBegin(
        _ gestureRecognizer:UIGestureRecognizer) -> Bool
    {
        guard
            
            let panning:UIPanGestureRecognizer = gestureRecognizer as? UIPanGestureRecognizer
            
        else
        {
            return false
        }
        
        let velocity:CGPoint = panning.velocity(in:self)
        let velocityX:CGFloat = fabs(velocity.x)
        let velocityY:CGFloat = fabs(velocity.y)
        let isHorizontal:Bool = velocityX > velocityY
        
        return isHorizontal
    }
}
