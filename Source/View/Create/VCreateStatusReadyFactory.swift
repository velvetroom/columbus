import UIKit

extension VCreateStatusReady
{
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
        
        NSLayoutConstraint.topToTop(
            view:viewBar,
            toView:self)
        viewBar.layoutHeight = NSLayoutConstraint.height(
            view:viewBar,
            constant:viewBar.kMaxHeight)
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
    }
}
