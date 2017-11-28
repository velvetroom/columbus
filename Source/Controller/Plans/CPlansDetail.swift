import Foundation

final class CPlansDetail:Controller<ArchPlansDetail>
{
    init(
        database:Database,
        settings:DSettings,
        plans:[DPlan])
    {
        super.init()
        
        model.database = database
        model.settings = settings
        model.plans = plans
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
