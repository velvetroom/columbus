import Foundation
import CoreData

extension Database
{
    private static let kModelName:String = "Columbus"
    private static let kModelExtension:String = "momd"
    private static let kSQLiteExtension:String = "sqlite"
    private static let kSeparator:String = "."
    
    //MARK: private
    
    private class func factoryModel() -> NSManagedObjectModel?
    {
        guard
            
            let modelURL:URL = Bundle.main.url(
                forResource:kModelName,
                withExtension:kModelExtension),
            let managedObjectModel:NSManagedObjectModel = NSManagedObjectModel(
                contentsOf:modelURL)
            
        else
        {
            return nil
        }
        
        return managedObjectModel
    }
    
    private class func factoryCoordinator(
        bundle:Bundle?,
        managedObjectModel:NSManagedObjectModel) -> NSPersistentStoreCoordinator?
    {
        let url:URL = factoryCoordinatorUrl(bundle:bundle)
        let persistentStoreCoordinator:NSPersistentStoreCoordinator = NSPersistentStoreCoordinator(
            managedObjectModel:managedObjectModel)
        
        do
        {
            try persistentStoreCoordinator.addPersistentStore(
                ofType:NSSQLiteStoreType,
                configurationName:nil,
                at:url,
                options:nil)
        }
        catch
        {
            return nil
        }
        
        return persistentStoreCoordinator
    }
    
    private class func factoryCoordinatorUrl(bundle:Bundle?) -> URL
    {
        let storeBundle:Bundle
        let bundleIdentifier:String
        
        if let bundle:Bundle = bundle
        {
            storeBundle = bundle
        }
        else
        {
            storeBundle = Bundle.main
        }
        
        if let identifier:String = storeBundle.bundleIdentifier
        {
            bundleIdentifier = identifier
        }
        else
        {
            bundleIdentifier = String()
        }
        
        var sqliteFile:String = bundleIdentifier
        sqliteFile.append(kSeparator)
        sqliteFile.append(kModelName)
        sqliteFile.append(kSeparator)
        sqliteFile.append(kSQLiteExtension)
        
        let url:URL = FileManager.default.appDirectory.appendingPathComponent(
            sqliteFile)
        
        return url
    }
    
    //MARK: internal
    
    class func factoryContext(
        bundle:Bundle?) -> NSManagedObjectContext?
    {
        guard
            
            let managedObjectModel:NSManagedObjectModel = factoryModel(),
            let persistentStoreCoordinator:NSPersistentStoreCoordinator = factoryCoordinator(
                bundle:bundle,
                managedObjectModel:managedObjectModel)
            
        else
        {
            return nil
        }
        
        let managedObjectContext:NSManagedObjectContext = NSManagedObjectContext(
            concurrencyType:
            NSManagedObjectContextConcurrencyType.privateQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
        managedObjectContext.mergePolicy = NSMergePolicy(
            merge:NSMergePolicyType.mergeByPropertyStoreTrumpMergePolicyType)
        
        return managedObjectContext
    }
    
    class func factoryFetchRequest(
        entityName:String,
        limit:Int,
        predicate:NSPredicate?,
        sorters:[NSSortDescriptor]?) -> NSFetchRequest<NSManagedObject>
    {
        let fetchRequest:NSFetchRequest<NSManagedObject> = NSFetchRequest(
            entityName:entityName)
        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = sorters
        fetchRequest.fetchLimit = limit
        fetchRequest.returnsObjectsAsFaults = false
        fetchRequest.includesPropertyValues = true
        fetchRequest.includesSubentities = true
        
        return fetchRequest
    }
}
