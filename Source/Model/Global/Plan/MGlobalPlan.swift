import Foundation

struct MGlobalPlan
{
    //MARK: private
    
    private static func asyncDelete(
        database:Database,
        plan:DPlan,
        completion:@escaping(() -> ()))
    {
        guard
            
            let identifier:String = plan.identifier
            
        else
        {
            return
        }
        
        deleteDirectory(identifier:identifier)
        
        database.delete(data:plan)
        {
            itemDeleted(
                database:database,
                completion:completion)
        }
    }
    
    private static func itemDeleted(
        database:Database,
        completion:@escaping(() -> ()))
    {
        database.save
        {
            completion()
        }
    }
    
    //MARK: internal
    
    static func delete(
        database:Database,
        plan:DPlan,
        completion:@escaping(() -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        {
            asyncDelete(
                database:database,
                plan:plan,
                completion:completion)
        }
    }
}
