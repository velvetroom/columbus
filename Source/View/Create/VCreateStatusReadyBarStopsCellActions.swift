import UIKit

extension VCreateStatusReadyBarStopsCell
{
    //MARK: selectors
    
    @objc
    func selectorRemove(sender button:UIButton)
    {
        guard
        
            let model:DPlanStop = self.model
        
        else
        {
            return
        }
        
        controller?.model.plan?.remove(
            stop:model)
    }
}
