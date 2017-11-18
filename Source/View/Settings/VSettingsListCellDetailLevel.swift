import UIKit

final class VSettingsListCellDetailLevel:VSettingsListCell
{
    weak var viewList:VSettingsListCellDetailLevelList?
    private weak var model:MSettingsDetailLevel?
    
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
            
            let model:MSettingsDetailLevel = model as? MSettingsDetailLevel
            
        else
        {
            return
        }
        
        self.model = model
        
        factoryList(controller:controller)
        reloadList(model:model)
    }
    
    //MARK: private
    
    private func reloadList(model:MSettingsDetailLevel)
    {
        viewList?.reload(model:model)
    }
}
