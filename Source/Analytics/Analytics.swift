import Foundation
import Firebase

final class Analytics
{
    //MARK: internal
    
    class func start()
    {
        FirebaseConfiguration.shared.setLoggerLevel(FirebaseLoggerLevel.min)
        FirebaseApp.configure()
    }
}
