import UIKit

extension VSettingsMemory
{
    //MARK: internal
    
    func factoryViews(controller:CSettingsMemory)
    {
        let viewBar:VSettingsMemoryBar = VSettingsMemoryBar(controller:controller)
        
        let viewSpinner:VSettingsMemorySpinner = VSettingsMemorySpinner()
        self.viewSpinner = viewSpinner
        
        let viewList:VSettingsMemoryList = VSettingsMemoryList(controller:controller)
        self.viewList = viewList
        
        addSubview(viewList)
        addSubview(viewBar)
        addSubview(viewSpinner)
        
        NSLayoutConstraint.topToTop(
            view:viewBar,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBar,
            constant:ViewMain.Constants.barHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:viewSpinner,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:viewList,
            toView:self)
    }
}
