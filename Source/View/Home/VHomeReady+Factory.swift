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
        
        let viewMenu:VHomeReadyMenu = VHomeReadyMenu(controller:controller)
        self.viewMenu = viewMenu
        
        addSubview(viewMap)
        addSubview(viewBar)
        addSubview(viewMenu)
        
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
        layoutBarBottom = NSLayoutConstraint.bottomToBottom(
            view:viewBar,
            toView:self,
            constant:-ViewMain.Constants.menuHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self)
        
        NSLayoutConstraint.bottomToBottom(
            view:viewMenu,
            toView:viewMap)
        NSLayoutConstraint.rightToRight(
            view:viewMenu,
            toView:self)
        NSLayoutConstraint.width(
            view:viewMenu,
            constant:VHomeReady.Constants.menuWidth)
        viewMenu.layoutHeight = NSLayoutConstraint.height(
            view:viewMenu)
    }
}
