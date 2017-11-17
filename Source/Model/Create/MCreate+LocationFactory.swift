import Foundation
import CoreLocation

extension MCreate
{
    //MARK: private
    
    private class func locationStrategyMap() -> [CLAuthorizationStatus:MCreateLocationStrategyProtocol.Type]
    {
        let map:[CLAuthorizationStatus:MCreateLocationStrategyProtocol.Type] = [
                CLAuthorizationStatus.authorizedAlways : MCreateLocationStrategyReady.self,
                CLAuthorizationStatus.authorizedWhenInUse : MCreateLocationStrategyReady.self,
                CLAuthorizationStatus.notDetermined : MCreateLocationStrategyUnknown.self,
                CLAuthorizationStatus.restricted : MCreateLocationStrategyDenied.self,
                CLAuthorizationStatus.denied : MCreateLocationStrategyDenied.self]
        
        return map
    }
    
    //MARK: internal
    
    class func factoryLocationStrategy(status:CLAuthorizationStatus) -> MCreateLocationStrategyProtocol.Type
    {
        let map:[CLAuthorizationStatus:MCreateLocationStrategyProtocol.Type] = locationStrategyMap()
        
        guard
            
            let type:MCreateLocationStrategyProtocol.Type = map[status]
            
        else
        {
            return MCreateLocationStrategyUnknown.self
        }
        
        return type
    }
}
