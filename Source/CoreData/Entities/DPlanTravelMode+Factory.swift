import MapKit

extension DPlanTravelMode
{
    //MARK: private
    
    private static func factoryTransportType(travelMode:DPlanTravelMode) -> MKDirectionsTransportType
    {
        guard
        
            let transportType:MKDirectionsTransportType = DPlanTravelMode.Constants.mapTransportType[
                travelMode]
        
        else
        {
            return MKDirectionsTransportType.any
        }
        
        return transportType
    }
    
    //MARK: internal
    
    func factoryTransportType() -> MKDirectionsTransportType
    {
        let transportType:MKDirectionsTransportType = DPlanTravelMode.factoryTransportType(
            travelMode:self)
        
        return transportType
    }
}
