import UIKit

extension VCreateStatusReadyBarLoader
{
    struct Constants
    {
        struct UI
        {
            static let animationDuration:TimeInterval = 1
            static let fadeDuration:TimeInterval = 0.3
        }
        
        struct Dispatch
        {
            static let queueName:String = "iturbide.columbus.loader"
            static let semaphoreCount:Int = 1
        }
    }
}
