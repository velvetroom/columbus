import Foundation
import CoreData

final class Database
{
    let managedObjectContext:NSManagedObjectContext
    
    init?(bundle:Bundle?)
    {
        guard
            
            let managedObjectContext:NSManagedObjectContext = Database.factoryContext(
                bundle:bundle)
            
        else
        {
            return nil
        }
        
        self.managedObjectContext = managedObjectContext
    }
    
    //MARK: internal
    
    func save(completion:@escaping(() -> ()))
    {
        if managedObjectContext.hasChanges
        {
            managedObjectContext.perform
            {
                do
                {
                    try self.managedObjectContext.save()
                }
                catch let error
                {
                    assertionFailure(error.localizedDescription)
                    
                    return
                }
                
                completion()
            }
        }
        else
        {
            completion()
        }
    }
    
    func create<T:NSManagedObject>(
        completion:@escaping((T) -> ()))
    {
        managedObjectContext.perform
        {
            guard
                
                let entityDescription:NSEntityDescription = NSEntityDescription.entity(
                    forEntityName:T.entityName,
                    in:self.managedObjectContext),
                let managedObject:T = NSManagedObject(
                    entity:entityDescription,
                    insertInto:self.managedObjectContext) as? T
                
            else
            {
                return
            }
            
            completion(managedObject)
        }
    }
    
    func fetch<T:NSManagedObject>(
        limit:Int = 0,
        predicate:NSPredicate? = nil,
        sorters:[NSSortDescriptor]? = nil,
        completion:@escaping(([T]) -> ()))
    {
        let fetchRequest:NSFetchRequest<NSManagedObject> = Database.factoryFetchRequest(
            entityName:T.entityName,
            limit:limit,
            predicate:predicate,
            sorters:sorters)
        
        managedObjectContext.perform
        {
            let data:[NSManagedObject]
            
            do
            {
                data = try self.managedObjectContext.fetch(
                    fetchRequest)
            }
            catch
            {
                return
            }
            
            guard
                
                let results:[T] = data as? [T]
                
            else
            {
                return
            }
            
            completion(results)
        }
    }
    
    func delete(data:NSManagedObject, completion:(() -> ())?)
    {
        managedObjectContext.perform
        {
            self.managedObjectContext.delete(data)
            completion?()
        }
    }
}
