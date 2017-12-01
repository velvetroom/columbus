import Foundation

final class MPlansDetail:Model<ArchPlansDetail>
{
    var items:[MPlansDetailItemProtocol]
    var database:Database?
    var settings:DSettings?
    var plan:DPlan?
    {
        didSet
        {
            guard
                
                let plan:DPlan = self.plan
            
            else
            {
                return
            }
            
            items = MPlansDetail.factoryItems(plan:plan)
        }
    }
    
    required init()
    {
        items = []
        
        super.init()
    }
}
