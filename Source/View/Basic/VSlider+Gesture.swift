import UIKit

extension VSlider:UIGestureRecognizerDelegate
{
    //MARK: selectors
    
    @objc
    private func selectorPanning(sender gesture:UIPanGestureRecognizer)
    {
        guard
        
            let router:Router = VSlider.Constants.routerMap[gesture.state]
        
        else
        {
            return
        }
        
        router(self)(gesture)
    }
    
    //MARK: private
    
    private func updateBar(
        newWidth:CGFloat,
        totalWidth:CGFloat)
    {
        layoutBarWidth.constant = newWidth
        let percentUsed:CGFloat = newWidth / totalWidth
        self.percentUsed = percentUsed
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
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
    
    func gestureBegan(gesture:UIPanGestureRecognizer)
    {
        panInitialWidth = layoutBarWidth.constant
    }
    
    func gestureChanged(gesture:UIPanGestureRecognizer)
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
    
    func gestureEnded(gesture:UIPanGestureRecognizer)
    {
        panInitialWidth = nil
        slidingFinished?()
    }
    
    //MARK: gestureRecognizer delegate
    
    override func gestureRecognizerShouldBegin(_ gestureRecognizer:UIGestureRecognizer) -> Bool
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
