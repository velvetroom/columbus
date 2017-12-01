import Foundation

final class MPlansDetail:Model<ArchPlansDetail>
{
    private(set) var items:[MPlansDetailItemProtocol]
    private(set) var database:Database?
    private(set) var settings:DSettings?
    private(set) var plan:DPlan?
    
    required init()
    {
        items = []
        
        super.init()
    }
    
    //MARK: internal
    
    func config(
        database:Database,
        plan:DPlan,
        settings:DSettings)
    {
        self.database = database
        self.plan = plan
        self.settings = settings
        
        items = MPlansDetail.factoryItems(
            plan:plan,
            settings:settings)
    }
}
