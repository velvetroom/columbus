import UIKit

extension VHomeReady
{
    //MARK: internal
    
    func factoryViews()
    {
        let viewMap:VHomeReadyMap = VHomeReadyMap(
            controller:controller)
        self.viewMap = viewMap
        
        addSubview(viewMap)
        
        NSLayoutConstraint.equals(
            view:viewMap,
            toView:self)
    }
}
