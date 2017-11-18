import UIKit

extension VSettings
{
    //MARK: internal
    
    func factoryViews(controller:CSettings)
    {
        let viewBar:VSettingsBar = VSettingsBar(controller:controller)
        
        let viewList:VSettingsList = VSettingsList(controller:controller)
        self.viewList = viewList
        
        addSubview(viewList)
        addSubview(viewBar)
        
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
            view:viewList,
            toView:self)
    }
}
