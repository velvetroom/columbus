import Foundation

extension DSettings
{
    var travelMode:DPlanTravelMode
    {
        get
        {
            guard
                
                let travelMode:DPlanTravelMode = DPlanTravelMode(
                    rawValue:rawTravelMode)
                
            else
            {
                return DPlanTravelMode.unknown
            }
            
            return travelMode
        }
        
        set(newValue)
        {
            rawTravelMode = newValue.rawValue
        }
    }
    
    public override func awakeFromInsert()
    {
        travelMode = DPlanTravelMode.walking
    }
}
