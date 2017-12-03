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
    
    //MARK: private
    
    private func deleteCompleted()
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.controllerBack()
        }
    }
    
    private func controllerBack()
    {
        guard
        
            let controller:CPlansDetail = view?.controller as? CPlansDetail
        
        else
        {
            return
        }
        
        controller.back()
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
    
    func delete()
    {
        guard
        
            let database:Database = self.database,
            let plan:DPlan = self.plan
        
        else
        {
            return
        }
        
        MGlobalPlan.delete(
            database:database,
            plan:plan)
        { [weak self] in
            
            self?.deleteCompleted()
        }
    }
}
