import UIKit
import CoreLocation

final class MCreateMapMenuStop:MCreateMapMenuProtocol
{
    let statusType:MCreateMapStatusProtocol.Type? = nil
    let icon:UIImage = #imageLiteral(resourceName: "assetMapButtonStop")
    
    //MARK: private
    
    //MARK: internal
    
    func selected(controller:CCreate)
    {
        guard
            
            let view:VCreateStatusReady = controller.model.view?.view as? VCreateStatusReady
            
        else
        {
            return
        }
        
        let coordinate:CLLocationCoordinate2D = view.viewMap.coordinateAtCentre()
        
        
    }
}
