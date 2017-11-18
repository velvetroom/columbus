import MapKit

extension DPlanTravelMode
{
    private static let kMapTransportType:[
        DPlanTravelMode:MKDirectionsTransportType] = [
            DPlanTravelMode.walking:
                MKDirectionsTransportType.walking,
            DPlanTravelMode.cycling:
                MKDirectionsTransportType.walking,
            DPlanTravelMode.transit:
                MKDirectionsTransportType.transit,
            DPlanTravelMode.driving:
                MKDirectionsTransportType.automobile]
    
    //MARK: private
    
    private static func factoryTransportType(
        travelMode:DPlanTravelMode) -> MKDirectionsTransportType
    {
        guard
        
            let transportType:MKDirectionsTransportType = kMapTransportType[
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
