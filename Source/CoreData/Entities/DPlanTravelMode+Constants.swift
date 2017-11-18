import Foundation
import MapKit

extension DPlanTravelMode
{
    struct Constants
    {
        static let mapTransportType:[DPlanTravelMode:MKDirectionsTransportType] = [
            DPlanTravelMode.walking : MKDirectionsTransportType.walking,
            DPlanTravelMode.cycling : MKDirectionsTransportType.walking,
            DPlanTravelMode.transit : MKDirectionsTransportType.transit,
            DPlanTravelMode.driving : MKDirectionsTransportType.automobile]
    }
}
