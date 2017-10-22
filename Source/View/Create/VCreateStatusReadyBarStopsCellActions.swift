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
        
        DispatchQueue.global(
            qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.controller?.model.plan?.remove(
                stop:model)
        }
    }
}
