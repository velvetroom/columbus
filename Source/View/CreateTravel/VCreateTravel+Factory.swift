import UIKit

extension VCreateTravel
{
    //MARK: internal
    
    func factoryViews(controller:CCreateTravel)
    {
        let viewBackground:VCreateTravelBackground = VCreateTravelBackground(controller:controller)
        let viewList:VCreateTravelList = VCreateTravelList(controller:controller)
        
        addSubview(viewBackground)
        addSubview(viewList)
        
        NSLayoutConstraint.equals(
            view:viewBackground,
            toView:self)
        
        layoutListTop = NSLayoutConstraint.topToTop(
            view:viewList,
            toView:self)
        NSLayoutConstraint.height(
            view:viewList,
            constant:kListHeight)
        layoutListLeft = NSLayoutConstraint.leftToLeft(
            view:viewList,
            toView:self)
        NSLayoutConstraint.width(
            view:viewList,
            constant:kListWidth)
    }
}
