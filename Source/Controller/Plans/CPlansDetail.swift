import Foundation

final class CPlansDetail:Controller<ArchPlansDetail>
{
    init(
        database:Database,
        settings:DSettings,
        plan:DPlan)
    {
        super.init()
        
        model.config(
            database:database,
            plan:plan,
            settings:settings)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: internal
    
    func back()
    {
        parentController?.pop(horizontal:ControllerTransition.Horizontal.right)
    }
}
