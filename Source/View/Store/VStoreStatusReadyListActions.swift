import UIKit

extension VStoreStatusReadyList
{
    //MARK: internal
    
    func modelAtIndex(index:IndexPath) -> MStorePerkProtocol
    {
        let item:MStorePerkProtocol = controller.model.perks[
            index.item]
        
        return item
    }
}
