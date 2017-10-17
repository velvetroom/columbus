import Foundation
import CoreData

extension NSManagedObject
{
    open class var entityName:String
    {
        get
        {
            let stringName:String = String(describing:self)
            
            return stringName
        }
    }
}
