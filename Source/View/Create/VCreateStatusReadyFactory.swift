import UIKit

extension VCreateStatusReady
{
    //MARK: private
    
    private func animateStart()
    {
        DispatchQueue.main.asyncAfter(
            deadline:
            DispatchTime.now() + kWaitForAnimation)
        { [weak self] in
            
            self?.viewBar.animateStart()
        }
    }
    
    //MARK: internal
    
    func factoryViews()
    {
        let viewBar:VCreateStatusReadyBar = VCreateStatusReadyBar(
            controller:controller)
        self.viewBar = viewBar
        
        let viewMap:VCreateStatusReadyMap = VCreateStatusReadyMap()
        self.viewMap = viewMap
        
        addSubview(viewMap)
        addSubview(viewBar)
        
        viewBar.layoutTop = NSLayoutConstraint.topToTop(
            view:viewBar,
            toView:self,
            constant:-viewBar.kHeight)
        NSLayoutConstraint.height(
            view:viewBar,
            constant:viewBar.kHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self)
        
        NSLayoutConstraint.topToBottom(
            view:viewMap,
            toView:viewBar)
        NSLayoutConstraint.bottomToBottom(
            view:viewMap,
            toView:self,
            constant:kBottom)
        NSLayoutConstraint.equalsHorizontal(
            view:viewMap,
            toView:self)
        
        animateStart()
    }
}
