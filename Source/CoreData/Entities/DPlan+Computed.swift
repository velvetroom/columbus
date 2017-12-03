import Foundation

extension DPlan
{
    var origin:DPlanStop?
    {
        get
        {
            let stop:DPlanStop? = stops?.firstObject as? DPlanStop
            
            return stop
        }
    }
    
    var destination:DPlanStop?
    {
        get
        {
            let stop:DPlanStop? = stops?.lastObject as? DPlanStop
            
            return stop
        }
    }
    
    var stopsList:[DPlanStop]
    {
        get
        {
            guard
            
                let stops:[DPlanStop] = self.stops?.array as? [DPlanStop]
            
            else
            {
                return []
            }
            
            return stops
        }
    }
    
    var travelsList:[DPlanTravel]
    {
        get
        {
            guard
                
                let travels:[DPlanTravel] = self.travels?.array as? [DPlanTravel]
                
            else
            {
                return []
            }
            
            return travels
        }
    }
}
