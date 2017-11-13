import UIKit

final class CCreateSave:Controller<ArchCreateSave>
{
    init(
        database:Database,
        plan:DPlan,
        settings:DSettings)
    {
        super.init()
        
        model.database = database
        model.plan = plan
        model.settings = settings
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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        model.save()
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
        
        parentController?.pop(
            vertical:ControllerParent.Vertical.bottom)
        {
            viewParent.viewMenu.synthSelect(
                order:order)
        }
    }
    
    func cancel()
    {
        model.cancel()
        
        parentController?.pop(
            vertical:ControllerParent.Vertical.bottom)
    }
}
