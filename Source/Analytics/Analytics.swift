import Foundation
import Firebase

final class Analytics
{    
    //MARK: internal
    
    class func start()
    {
        FirebaseConfiguration.shared.setLoggerLevel(FirebaseLoggerLevel.max)
        FirebaseApp.configure()
    }
    
    class func setScreenView(controller:UIViewController)
    {
        let controllerType:UIViewController.Type = type(of:controller)
        let controllerName:String = String(describing:controllerType)
        Firebase.Analytics.setScreenName(controllerName, screenClass:controllerName)
    }
}
