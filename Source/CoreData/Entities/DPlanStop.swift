import Foundation
import CoreLocation

extension DPlanStop
{
    var coordinate:CLLocationCoordinate2D
    {
        get
        {
            let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2D(
                latitude:latitude,
                longitude:longitude)
            
            return coordinate
        }
        
        set(newValue)
        {
            latitude = newValue.latitude
            longitude = newValue.longitude
        }
    }
}
