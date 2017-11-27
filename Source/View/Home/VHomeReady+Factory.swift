import UIKit

extension VHomeReady
{
    //MARK: internal
    
    func factoryViews()
    {
        let viewMap:VHomeReadyMap = VHomeReadyMap(controller:controller)
        self.viewMap = viewMap
        
        let viewBar:VHomeReadyBar = VHomeReadyBar(controller:controller)
        self.viewBar = viewBar
        
        let viewMapMenu:VHomeReadyMapMenu = VHomeReadyMapMenu(controller:controller)
        self.viewMapMenu = viewMapMenu
        
        addSubview(viewMap)
        addSubview(viewBar)
        addSubview(viewMapMenu)
        
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
            view:viewBar,
            constant:VHomeReady.Constants.barHeight)
        viewBar.layoutBottom = NSLayoutConstraint.bottomToBottom(
            view:viewBar,
            toView:self,
            constant:-ViewMain.Constants.menuHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self)
        
        NSLayoutConstraint.bottomToBottom(
            view:viewMapMenu,
            toView:viewMap)
        NSLayoutConstraint.rightToRight(
            view:viewMapMenu,
            toView:self)
        NSLayoutConstraint.width(
            view:viewMapMenu,
            constant:VHomeReady.Constants.menuWidth)
        viewMapMenu.layoutHeight = NSLayoutConstraint.height(
            view:viewMapMenu)
    }
}
