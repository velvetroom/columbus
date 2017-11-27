import UIKit

final class MHomeMapMenuUser:MHomeMapMenuProtocol
{
    let statusType:MHomeMapStatusProtocol.Type? = nil
    let icon:UIImage = #imageLiteral(resourceName: "assetMapButtonUser")
    let iconSelected:UIImage = #imageLiteral(resourceName: "assetMapButtonUserSelected")
    
    //MARK: internal
    
    func selected(controller:CHome)
    {
        guard
            
            let view:VHomeReady = controller.model.view?.view as? VHomeReady
            
        else
        {
            return
        }
        
        view.viewMap.centreUser()
    }
}
