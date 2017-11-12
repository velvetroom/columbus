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
        self.viewList = viewList
        
        addSubview(viewCancel)
        addSubview(viewList)
        
        NSLayoutConstraint.equals(
            view:viewCancel,
            toView:self)
        
        viewList.layoutTop = NSLayoutConstraint.topToTop(
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
