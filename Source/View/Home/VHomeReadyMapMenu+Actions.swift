import UIKit

extension VHomeReadyMapMenu
{
    //MARK: internal
    
    func modelAtIndex(index:IndexPath) -> MHomeMapMenuProtocol
    {
        let item:MHomeMapMenuProtocol = controller.model.mapStatus!.menuItems[index.item]
        
        return item
    }
}
