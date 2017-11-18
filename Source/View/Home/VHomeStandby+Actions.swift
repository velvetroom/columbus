import UIKit

extension VHomeStandby
{
    //MARK: internal
    
    func modelAtIndex(index:IndexPath) -> MHomeInfoProtocol
    {
        let item:MHomeInfoProtocol = controller.model.info[index.item]
        
        return item
    }
}
