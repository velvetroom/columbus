import UIKit

extension VCreateTravelList
{
    //MARK: internal
    
    func modelAtIndex(index:IndexPath) -> MCreateTravelProtocol
    {
        let item:MCreateTravelProtocol = controller.model.items[
            index.item]
        
        return item
    }
}
