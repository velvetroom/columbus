import UIKit

final class VSettingsListCellTravelMode:VSettingsListCell
{
    private weak var model:MSettingsTravelMode?
    
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
    }
}
