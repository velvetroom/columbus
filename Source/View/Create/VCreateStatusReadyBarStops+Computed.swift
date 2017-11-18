import Foundation

extension VCreateStatusReadyBarStops
{
    var model:[DPlanStop]?
    {
        get
        {
            return controller.model.plan?.plan.stops?.array as? [DPlanStop]
        }
    }
    
    var travel:[DPlanTravel]?
    {
        get
        {
            return controller.model.plan?.plan.travels?.array as? [DPlanTravel]
        }
    }
    
    var distanceSettings:DSettingsDistance?
    {
        get
        {
            return controller.model.settings?.distance
        }
    }
}
