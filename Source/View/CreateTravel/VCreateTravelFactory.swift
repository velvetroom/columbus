import UIKit

extension VCreateTravel
{
    //MARK: internal
    
    func factoryViews(controller:CCreateTravel)
    {
        let viewBackground:VCreateTravelBackground = VCreateTravelBackground(
            controller:controller)
        
        addSubview(viewBackground)
        
        NSLayoutConstraint.equals(
            view:viewBackground,
            toView:self)
    }
}
