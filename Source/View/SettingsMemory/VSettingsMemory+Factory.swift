import UIKit

extension VSettingsMemory
{
    //MARK: internal
    
    func factoryViews(controller:CSettingsMemory)
    {
        let viewBar:VSettingsMemoryBar = VSettingsMemoryBar(
            controller:controller)
        
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
