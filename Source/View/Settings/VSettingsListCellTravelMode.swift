import UIKit

final class VSettingsListCellTravelMode:VSettingsListCell
{
    weak var viewList:VSettingsListCellTravelModeList?
    private weak var model:MSettingsTravelMode?
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        factoryCaption()
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
        
        factoryList(controller:controller)
        reloadList(model:model)
    }
    
    //MARK: private
    
    private func reloadList(model:MSettingsTravelMode)
    {
        viewList?.reload(model:model)
    }
}
