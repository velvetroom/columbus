import Foundation

final class CPlans:Controller<ArchPlans>
{
    override func viewDidAppear(_ animated:Bool)
    {
        super.viewDidAppear(animated)
        
        model.load()
    }
    
    //MARK: internal
    
    func showDetail(plan:DPlan)
    {
        guard
            
            let database:Database = model.database,
            let settings:DSettings = model.settings
        
        else
        {
            return
        }
        
        let controller:CPlansDetail = CPlansDetail(
            database:database,
            settings:settings,
            plan:plan)
        
        parentController?.push(
            controller:controller,
            horizontal:ControllerTransition.Horizontal.right)
    }
}
