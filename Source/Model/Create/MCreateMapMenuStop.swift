import UIKit
import CoreLocation

final class MCreateMapMenuStop:MCreateMapMenuProtocol
{
    let statusType:MCreateMapStatusProtocol.Type? = nil
    let icon:UIImage = #imageLiteral(resourceName: "assetMapButtonStop")
    let iconSelected:UIImage = #imageLiteral(resourceName: "assetMapButtonStopSelected")
    
    //MARK: private
    
    private func addStop(
        controller:CCreate,
        coordinate:CLLocationCoordinate2D)
    {
        controller.model.plan?.addStop(
            coordinate:coordinate)
    }
    
    //MARK: internal
    
    func selected(controller:CCreate)
    {
        guard
            
            let view:VCreateStatusReady = controller.model.view?.view as? VCreateStatusReady
            
        else
        {
            return
        }
        
        view.viewBar.viewLoader.loadProgress()
        let coordinate:CLLocationCoordinate2D = view.viewMap.coordinateAtCentre()
        
        DispatchQueue.global(
            qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.addStop(
                controller:controller,
                coordinate:coordinate)
        }
    }
}
