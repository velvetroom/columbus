import UIKit

extension VCreateStatusReady
{
    //MARK: internal
    
    func factoryViews()
    {
        let viewBar:VCreateStatusReadyBar = VCreateStatusReadyBar(
            controller:controller)
        self.viewBar = viewBar
        
        let viewMapMenu:VCreateStatusReadyMapMenu = VCreateStatusReadyMapMenu(
            controller:controller)
        self.viewMapMenu = viewMapMenu
        
        let viewMap:VCreateStatusReadyMap = VCreateStatusReadyMap()
        self.viewMap = viewMap
        
        addSubview(viewMap)
        addSubview(viewMapMenu)
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
        
        NSLayoutConstraint.topToTop(
            view:viewMapMenu,
            toView:viewMap)
        viewMapMenu.layoutHeight = NSLayoutConstraint.height(
            view:viewMapMenu)
        NSLayoutConstraint.width(
            view:viewMapMenu,
            constant:kMapMenuWidth)
        NSLayoutConstraint.rightToRight(
            view:viewMapMenu,
            toView:self)
    }
}
