import UIKit

final class VSettingsListCellDetailLevel:VSettingsListCell
{
    weak var viewList:VSettingsListCellDetailLevelList?
    let kCaptionHeight:CGFloat = 90
    let kCaptionLeft:CGFloat = 20
    let kTitleFontSize:CGFloat = 16
    let kDescrFontSize:CGFloat = 14
    let kListTop:CGFloat = 100
    let kListBottom:CGFloat = -20
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
    
    private func reloadList(
        model:MSettingsDetailLevel)
    {
        viewList?.reload(model:model)
    }
}
