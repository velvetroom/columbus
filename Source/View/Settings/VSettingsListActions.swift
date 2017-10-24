import UIKit

extension VSettingsList
{
    //MARK: internal
    
    func modelAtIndex(
        index:IndexPath) -> MSettingsProtocol
    {
        let item:MSettingsProtocol = controller.model.items[
            index.item]
        
        return item
    }
}
