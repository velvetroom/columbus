import UIKit

extension VSettings
{
    //MARK: internal
    
    func factoryViews(controller:CSettings)
    {
        let viewBar:VSettingsBar = VSettingsBar(
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
