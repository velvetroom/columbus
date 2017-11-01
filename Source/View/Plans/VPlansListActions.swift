import UIKit

extension VPlansList
{
    //MARK: internal
    
    func modelAtIndex(index:IndexPath) -> DPlan
    {
        let item:DPlan = controller.model.plans![
            index.item]
        
        return item
    }
}
