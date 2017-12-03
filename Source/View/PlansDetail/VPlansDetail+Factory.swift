import UIKit

extension VPlansDetail
{
    //MARK: internal
    
    func factoryViews(controller:CPlansDetail)
    {
        let viewBar:VPlansDetailBar = VPlansDetailBar(controller:controller)
        
        let viewList:VPlansDetailList = VPlansDetailList(controller:controller)
        
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
