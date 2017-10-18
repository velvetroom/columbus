import Foundation
import CoreLocation

extension MCreate
{
    //MARK: private
    
    private class func locationStrategyMap() -> [
        CLAuthorizationStatus:MCreateLocationStrategyProtocol.Type]
    {
        let map:[CLAuthorizationStatus:
            MCreateLocationStrategyProtocol.Type] = [
                CLAuthorizationStatus.authorizedAlways:
                    MCreateLocationStrategyGranted.self,
                CLAuthorizationStatus.authorizedWhenInUse:
                    MCreateLocationStrategyGranted.self,
                CLAuthorizationStatus.notDetermined:
                    MCreateLocationStrategyUnknown.self,
                CLAuthorizationStatus.restricted:
                    MCreateLocationStrategyDenied.self,
                CLAuthorizationStatus.denied:
                    MCreateLocationStrategyDenied.self]
        
        return map
    }
    
    private class func locationStrategyType(
        status:CLAuthorizationStatus) -> MCreateLocationStrategyProtocol.Type
    {
        let map:[
            CLAuthorizationStatus:
            MCreateLocationStrategyProtocol.Type] = locationStrategyMap()
        
        guard
        
            let type:MCreateLocationStrategyProtocol.Type = map[status]
        
        else
        {
            return MCreateLocationStrategyUnknown.self
        }
        
        return type
    }
    
    //MARK: internal
    
    class func factoryLocationStrategy() -> MCreateLocationStrategyProtocol.Type
    {
        let status:CLAuthorizationStatus = CLLocationManager.authorizationStatus()
        let strategyType:MCreateLocationStrategyProtocol.Type = locationStrategyType(
            status:status)
        
        return strategyType
    }
}
