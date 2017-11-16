import UIKit

extension VSettingsMemoryList
{
    //MARK: internal
    
    func modelAtIndex(index:IndexPath) -> MSettingsMemoryItem
    {
        let item:MSettingsMemoryItem = controller.model.items[
            index.item]
        
        return item
    }
}
