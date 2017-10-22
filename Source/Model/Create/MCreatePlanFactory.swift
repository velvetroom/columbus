import Foundation
import CoreLocation

extension MCreatePlan
{
    //MARK: internal
    
    class func factoryLocation(
        coordinate:CLLocationCoordinate2D) -> CLLocation
    {
        let location:CLLocation = CLLocation(
            latitude:coordinate.latitude,
            longitude:coordinate.longitude)
        
        return location
    }
    
    class func factoryLocation(
        stop:DPlanStop) -> CLLocation
    {
        let location:CLLocation = factoryLocation(
            coordinate:stop.coordinate)
        
        return location
    }
}
