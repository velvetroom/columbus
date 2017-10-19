import Foundation

extension DPlanTravel
{
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
}
