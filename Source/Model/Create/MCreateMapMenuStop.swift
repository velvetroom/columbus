import UIKit
import CoreLocation

final class MCreateMapMenuStop:MCreateMapMenuProtocol
{
    let statusType:MCreateMapStatusProtocol.Type? = nil
    let icon:UIImage = #imageLiteral(resourceName: "assetMapButtonStop")
    let iconSelected:UIImage = #imageLiteral(resourceName: "assetMapButtonStopSelected")
    
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
        controller.addStop(coordinate:coordinate)
    }
}
