import UIKit

final class VSettingsListCellTravelMode:VSettingsListCell
{
    private weak var model:MSettingsTravelMode?
    private weak var viewList:VSettingsListCellTravelModeList?
    private let kLabelHeight:CGFloat = 70
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func config(
        controller:CSettings,
        model:MSettingsProtocol)
    {
        super.config(
            controller:controller,
            model:model)
        
        guard
        
            let model:MSettingsTravelMode = model as? MSettingsTravelMode
        
        else
        {
            return
        }
        
        self.model = model
        
        factoryList()
        reloadList()
    }
    
    //MARK: private
    
    private func factoryList()
    {
        guard
        
            self.viewList == nil,
            let controller:CSettings = self.controller
        
        else
        {
            return
        }
        
        let viewList:VSettingsListCellTravelModeList = VSettingsListCellTravelModeList(
            controller:controller)
        self.viewList = viewList
        
        addSubview(viewList)
        
        NSLayoutConstraint.topToTop(
            view:viewList,
            toView:self,
            constant:kLabelHeight)
        NSLayoutConstraint.bottomToBottom(
            view:viewList,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:viewList,
            toView:self)
    }
    
    private func reloadList()
    {
        guard
        
            let model:MSettingsTravelMode = self.model
        
        else
        {
            return
        }
        
        viewList?.reload(model:model)
    }
}
