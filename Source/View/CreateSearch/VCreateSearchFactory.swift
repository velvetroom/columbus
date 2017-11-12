import UIKit

extension VCreateSearch
{
    //MARK: internal
    
    func factoryViews(controller:CCreateSearch)
    {
        let viewCancel:VCreateSearchCancel = VCreateSearchCancel(
            controller:controller)
        
        let viewBase:VCreateSearchBase = VCreateSearchBase(
            controller:controller)
        self.viewBase = viewBase
        
        addSubview(viewCancel)
        addSubview(viewBase)
        
        NSLayoutConstraint.equals(
            view:viewCancel,
            toView:self)
        
        viewBase.layoutTop = NSLayoutConstraint.topToTop(
            view:viewBase,
            toView:self,
            constant:-viewBase.kHeight)
        NSLayoutConstraint.height(
            view:viewBase,
            constant:viewBase.kHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBase,
            toView:self)
    }
}
