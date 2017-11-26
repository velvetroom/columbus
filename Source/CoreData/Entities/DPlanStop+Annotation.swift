import Foundation
import MapKit

extension DPlanStop:MKAnnotation
{
    public var coordinate:CLLocationCoordinate2D
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
    
    public var location:CLLocation
    {
        get
        {
            let location:CLLocation = CLLocation(
                latitude:latitude,
                longitude:longitude)
            
            return location
        }
        
        set(newValue)
        {
            latitude = newValue.coordinate.latitude
            longitude = newValue.coordinate.longitude
        }
    }
}
