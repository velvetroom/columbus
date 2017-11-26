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
        let distanceNumber:NSNumber = NSNumber(value:distance)
        
        guard
        
            let distanceString:String = VCreateStatusReadyBarStopsFooter.factoryDistance(
                distance:distanceNumber,
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
