import UIKit

extension VPlans
{
    //MARK: internal
    
    func factoryViews(controller:CPlans)
    {
        let viewBar:VPlansBar = VPlansBar(controller:controller)
        
        addSubview(viewBar)
        
        NSLayoutConstraint.topToTop(
            view:viewBar,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBar,
            constant:kBarHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self)
    }
}
