import UIKit

final class CCreateSave:Controller<ArchCreateSave>
{
    init(database:Database, plan:DPlan)
    {
        super.init()
        
        model.database = database
        model.plan = plan
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override var preferredStatusBarStyle:UIStatusBarStyle
    {
        get
        {
            return UIStatusBarStyle.lightContent
        }
    }
    
    //MARK: internal
    
    func moveToPlans()
    {
        guard
            
            let viewParent:ViewParent = parentController?.view as? ViewParent
            
        else
        {
            return
        }
        
        let order:MMenuOrder = MMenuOrder.plans
        viewParent.viewMenu.synthSelect(
            order:order)
    }
    
    func cancel()
    {
        parentController?.pop(
            vertical:ControllerParent.Vertical.bottom)
    }
}
