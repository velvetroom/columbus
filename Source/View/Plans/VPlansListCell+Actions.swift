import UIKit

extension VPlansListCell
{
    //MARK: internal
    
    func updateRoute(model:DPlan)
    {
        labelOrigin.text = model.origin?.name
        labelDestination.text = model.destination?.name
    }
    
    func updateCreated(model:DPlan)
    {
        guard
            
            let date:Date = model.created
        
        else
        {
            return
        }
        
        let dateString:String = dateFormatter.string(from:date)
        labelCreated.text = dateString
    }
    
    func updateButton(
        controller:CPlans,
        model:DPlan,
        active:Bool)
    {
        factoryButton(controller:controller)
        
        if active
        {
            viewButton?.active(model:model)
        }
        else
        {
            viewButton?.unactive(model:model)
        }
    }
}
