import UIKit

extension VHomeReadyMenu
{
    //MARK: internal
    
    func modelAtIndex(index:IndexPath) -> MCreateMapMenuProtocol
    {
        let item:MCreateMapMenuProtocol = controller.model.mapStatus!.menuItems[index.item]
        
        return item
    }
}
