import UIKit

final class VSettingsListCellDetailLevel:VSettingsListCell
{
    weak var viewList:VSettingsListCellTravelModeList?
    let kCaptionHeight:CGFloat = 90
    let kCaptionLeft:CGFloat = 20
    let kTitleFontSize:CGFloat = 16
    let kDescrFontSize:CGFloat = 14
    let kListBottom:CGFloat = -15
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
        reloadList()
    }
    
    //MARK: private
    
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
