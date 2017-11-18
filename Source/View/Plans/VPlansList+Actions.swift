import UIKit

extension VPlansList
{
    //MARK: internal
    
    func modelAtIndex(index:IndexPath) -> DPlan
    {
        let item:DPlan = controller.model.plans![index.item]
        
        return item
    }
    
    func modelIsActive(model:DPlan) -> Bool
    {
        guard
        
            let active:DPlan = controller.model.settings?.activePlan,
            active === model
        
        else
        {
            return false
        }
        
        return true
    }
}
