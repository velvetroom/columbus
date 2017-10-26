import UIKit

final class VCreateStatusReadyBarTravel:
    VCollection<
    ArchCreate,
    VCreateStatusReadyBarTravelCell>
{
    var model:[DPlanTravel]?
    {
        get
        {
            return controller.model.plan?.plan.travels?.array as? [
                DPlanTravel]
        }
    }
    
    required init(controller:CCreate)
    {
        super.init(controller:controller)
        config()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
