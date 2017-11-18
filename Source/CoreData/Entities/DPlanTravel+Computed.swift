import MapKit

extension DPlanTravel
{
    var status:DPlanTravelStatus
    {
        get
        {
            guard
                
                let status:DPlanTravelStatus = DPlanTravelStatus(
                    rawValue:rawStatus)
                
            else
            {
                return DPlanTravelStatus.unknown
            }
            
            return status
        }
        
        set(newValue)
        {
            rawStatus = newValue.rawValue
        }
    }
    
    var mode:DPlanTravelMode
    {
        get
        {
            guard
                
                let mode:DPlanTravelMode = DPlanTravelMode(
                    rawValue:rawMode)
                
            else
            {
                return DPlanTravelMode.unknown
            }
            
            return mode
        }
        
        set(newValue)
        {
            rawMode = newValue.rawValue
        }
    }
    
    var polyline:MKPolyline?
    {
        get
        {
            return transientPolyline
        }
        
        set(newValue)
        {
            transientPolyline = newValue
            rawLocations = newValue?.locations
        }
    }
}
