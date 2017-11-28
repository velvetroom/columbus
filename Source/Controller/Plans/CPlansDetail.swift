import Foundation

final class CPlansDetail:Controller<ArchPlansDetail>
{
    init(
        database:Database,
        settings:DSettings,
        plan:DPlan)
    {
        super.init()
        
        model.database = database
        model.settings = settings
        model.plan = plan
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
