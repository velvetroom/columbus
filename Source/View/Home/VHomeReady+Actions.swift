import Foundation
import CoreLocation

extension VHomeReady
{
    //MARK: private
    
    private func asyncDisplayDistance(item:DPlanStop)
    {
        guard
            
            let userLocation:CLLocation = viewMap.userLocation.location,
            let distanceSettings:DSettingsDistance = controller.model.settings?.distance
        
        else
        {
            return
        }
        
        let distance:CLLocationDistance = userLocation.distance(from:item.location)
        
        guard
        
            let distanceString:String = VFormat.factoryDistance(
                distance:distance,
                distanceSettings:distanceSettings)
        
        else
        {
            return
        }
        
        DispatchQueue.main.async
        { [weak self] in
            
            self?.toast(message:distanceString)
        }
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
