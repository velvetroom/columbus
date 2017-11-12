import UIKit

extension VCreateSearchBase
{
    //MARK: internal
    
    func factoryViews()
    {
        let border:VBorder = VBorder(
            colour:UIColor(white:0, alpha:0.2))
        
        let viewList:VCreateSearchBaseList = VCreateSearchBaseList(
            controller:controller)
        self.viewList = viewList
        
        let viewBar:VCreateSearchBaseBar = VCreateSearchBaseBar(
            controller:controller)
        self.viewBar = viewBar
        
        addSubview(border)
        addSubview(viewList)
        addSubview(viewBar)
        
        NSLayoutConstraint.bottomToBottom(
            view:border,
            toView:self)
        NSLayoutConstraint.height(
            view:border,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:viewList,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:viewBar,
            toView:self,
            constant:kBarTop)
        NSLayoutConstraint.height(
            view:viewBar,
            constant:kBarHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self)
    }
}
