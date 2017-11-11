import UIKit

extension VCreateSearch
{
    //MARK: internal
    
    func factoryViews(controller:CCreateSearch)
    {
        let viewCancel:VCreateSearchCancel = VCreateSearchCancel(
            controller:controller)
        
        addSubview(viewCancel)
        
        NSLayoutConstraint.equals(
            view:viewCancel,
            toView:self)
    }
}
