import Foundation

extension VCreateStatusReadyBarStops
{
    var model:[DPlanStop]?
    {
        get
        {
            return controller.model.plan?.plan.stopsList
        }
    }
    
    var travel:[DPlanTravel]?
    {
        get
        {
            return controller.model.plan?.plan.travelsList
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
