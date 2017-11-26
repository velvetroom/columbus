import Foundation
import CoreLocation

extension VHomeReady
{
    //MARK: private
    
    private func asyncDisplayDistance(item:DPlanStop)
    {
        guard
            
            let userLocation:CLLocation = viewMap.userLocation.location
        
        else
        {
            return
        }
        
        let distance:CLLocationDistance = userLocation.distance(from:item.location)
    }
    
    //MARK: internal
    
    func displayDistance(item:DPlanStop)
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncDisplayDistance(item:item)
        }
    }
}
