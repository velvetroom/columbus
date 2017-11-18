import UIKit

extension VCreateStatusReady
{
    //MARK: internal
    
    func factoryViews()
    {
        let viewBar:VCreateStatusReadyBar = VCreateStatusReadyBar(controller:controller)
        self.viewBar = viewBar
        
        let viewMapMenu:VCreateStatusReadyMapMenu = VCreateStatusReadyMapMenu(controller:controller)
        self.viewMapMenu = viewMapMenu
        
        let viewMap:VCreateStatusReadyMap = VCreateStatusReadyMap(controller:controller)
        self.viewMap = viewMap
        
        addSubview(viewMap)
        addSubview(viewMapMenu)
        addSubview(viewBar)
        
        viewBar.layoutTop = NSLayoutConstraint.topToTop(
            view:viewBar,
            toView:self,
            constant:-VCreateStatusReadyBar.Constants.height)
        NSLayoutConstraint.height(
            view:viewBar,
            constant:VCreateStatusReadyBar.Constants.height)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self)
        
        NSLayoutConstraint.topToBottom(
            view:viewMap,
            toView:viewBar)
        NSLayoutConstraint.bottomToBottom(
            view:viewMap,
            toView:self,
            constant:-ViewMain.Constants.menuHeight)
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
            constant:VCreateStatusReady.Constants.mapMenuWidth)
        NSLayoutConstraint.rightToRight(
            view:viewMapMenu,
            toView:self)
    }
}
