import UIKit

extension VCreateSearch
{
    //MARK: internal
    
    func factoryViews(controller:CCreateSearch)
    {
        let viewCancel:VCreateSearchCancel = VCreateSearchCancel(
            controller:controller)
        
        let viewList:VCreateSearchList = VCreateSearchList(
            controller:controller)
        
        addSubview(viewCancel)
        addSubview(viewList)
        
        NSLayoutConstraint.equals(
            view:viewCancel,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:viewList,
            toView:self,
            constant:-viewList.kHeight)
        NSLayoutConstraint.height(
            view:viewList,
            constant:viewList.kHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewList,
            toView:self)
    }
}
