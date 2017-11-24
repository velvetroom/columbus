import UIKit

extension VHomeReady
{
    //MARK: internal
    
    func factoryViews()
    {
        let viewMap:VHomeReadyMap = VHomeReadyMap(controller:controller)
        self.viewMap = viewMap
        
        let viewBar:VHomeReadyBar = VHomeReadyBar(controller:controller)
        
        addSubview(viewMap)
        addSubview(viewBar)
        
        NSLayoutConstraint.topToTop(
            view:viewMap,
            toView:self)
        NSLayoutConstraint.bottomToTop(
            view:viewMap,
            toView:viewBar)
        NSLayoutConstraint.equalsHorizontal(
            view:viewMap,
            toView:self)
        
        NSLayoutConstraint.height(
            view:viewMap,
            constant:VHomeReady.Constants.barHeight)
        layoutBarBottom = NSLayoutConstraint.bottomToBottom(
            view:viewMap,
            toView:self,
            constant:-VHomeReady.Constants.barHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewMap,
            toView:self)
    }
}
