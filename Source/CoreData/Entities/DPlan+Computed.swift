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
    
    var stopsArray:[DPlanStop]
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
}
