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
}
