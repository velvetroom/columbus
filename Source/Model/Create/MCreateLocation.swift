import Foundation
import CoreLocation

extension MCreate
{
    //MARK: internal
    
    func startLocation()
    {
        let locationStrategyType:MCreateLocationStrategyProtocol.Type = MCreate.factoryLocationStrategy()
        changeLocationStrategy(
            locationStrategyType:locationStrategyType)
    }
}
