import UIKit

extension VCreateStatusReady
{
    //MARK: internal
    
    func factoryViews()
    {
        let viewMap:VCreateStatusReadyMap = VCreateStatusReadyMap()
        self.viewMap = viewMap
        
        addSubview(viewMap)
        
        NSLayoutConstraint.topToTop(
            view:viewMap,
            toView:self)
        NSLayoutConstraint.bottomToBottom(
            view:viewMap,
            toView:self,
            constant:kBottom)
        NSLayoutConstraint.equalsHorizontal(
            view:viewMap,
            toView:self)
    }
}
