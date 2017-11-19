import UIKit

extension VSettingsMemory
{
    //MARK: internal
    
    func factoryViews(controller:CSettingsMemory)
    {
        let viewBar:VSettingsMemoryBar = VSettingsMemoryBar(controller:controller)
        
        let viewSpinner:VSpinner = VSpinner()
        self.viewSpinner = viewSpinner
        
        addSubview(viewBar)
        addSubview(viewSpinner)
        
        NSLayoutConstraint.topToTop(
            view:viewBar,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBar,
            constant:VSettingsMemory.Constants.Main.barHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:viewSpinner,
            toView:self)
    }
}
