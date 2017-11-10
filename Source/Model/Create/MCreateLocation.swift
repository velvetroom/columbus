import Foundation
import CoreLocation

extension MCreate
{
    //MARK: internal
    
    func checkAuthorization()
    {
        let status:CLAuthorizationStatus = CLLocationManager.authorizationStatus()
        checkAuthorization(status:status)
    }
    
    func checkAuthorization(status:CLAuthorizationStatus)
    {
        let locationStrategyType:MCreateLocationStrategyProtocol.Type = MCreate.factoryLocationStrategy(
            status:status)
        changeLocationStrategy(
            locationStrategyType:locationStrategyType)
    }
}
