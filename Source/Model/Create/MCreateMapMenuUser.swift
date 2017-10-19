import UIKit

final class MCreateMapMenuUser:MCreateMapMenuProtocol
{
    let statusType:MCreateMapStatusProtocol.Type? = nil
    let icon:UIImage = #imageLiteral(resourceName: "assetMapButtonUser")
    
    func selected(controller:CCreate)
    {
        guard
        
            let view:VCreateStatusReady = controller.model.view?.view as? VCreateStatusReady
        
        else
        {
            return
        }
        
        view.viewMap.centreUser()
    }
}
