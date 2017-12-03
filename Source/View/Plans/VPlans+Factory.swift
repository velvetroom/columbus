import UIKit

extension VPlans
{
    //MARK: internal
    
    func factoryViews(controller:CPlans)
    {
        let viewBar:VPlansBar = VPlansBar(controller:controller)
        
        let viewList:VPlansList = VPlansList(controller:controller)
        self.viewList = viewList
        
        addSubview(viewList)
        addSubview(viewBar)
        
        NSLayoutConstraint.topToTop(
            view:viewBar,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBar,
            constant:ViewMain.Constants.barHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:viewList,
            toView:self)
    }
}
