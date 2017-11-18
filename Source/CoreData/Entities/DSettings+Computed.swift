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
    
    var detailLevel:DSettingsDetailLevel
    {
        get
        {
            guard
            
                let detailLevel:DSettingsDetailLevel = DSettingsDetailLevel(
                    rawValue:rawDetailLevel)
            
            else
            {
                return DSettingsDetailLevel.min
            }
            
            return detailLevel
        }
        
        set(newValue)
        {
            rawDetailLevel = newValue.rawValue
        }
    }
    
    var distance:DSettingsDistance
    {
        get
        {
            guard
                
                let distance:DSettingsDistance = DSettingsDistance(
                    rawValue:rawDistancce)
                
            else
            {
                return DSettingsDistance.kilometres
            }
            
            return distance
        }
        
        set(newValue)
        {
            rawDistancce = newValue.rawValue
        }
    }
}
