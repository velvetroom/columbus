import UIKit

extension VHomeStandby
{
    //MARK: internal
    
    func factoryViews()
    {
        let viewHeader:VHomeStandbyHeader = VHomeStandbyHeader(controller:controller)
        
        addSubview(viewHeader)
        
        NSLayoutConstraint.topToTop(
            view:viewHeader,
            toView:self)
        layoutHeaderHeight = NSLayoutConstraint.height(
            view:viewHeader,
            constant:VHomeStandby.Constants.headerHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewHeader,
            toView:self)
    }
}
