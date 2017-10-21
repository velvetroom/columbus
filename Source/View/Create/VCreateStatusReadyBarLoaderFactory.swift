import UIKit

extension VCreateStatusReadyBarLoader
{
    private static let kQueueName:String = "iturbide.columbus.loader"
    private static let kSemaphoreCount:Int = 1
    
    //MARK: internal
    
    class func factoryDispatchQueue() -> DispatchQueue
    {
        let dispatchQueue:DispatchQueue = DispatchQueue(
            label:kQueueName,
            qos:DispatchQoS.background,
            attributes:DispatchQueue.Attributes(),
            autoreleaseFrequency:
            DispatchQueue.AutoreleaseFrequency.inherit,
            target:DispatchQueue.global(
                qos:DispatchQoS.QoSClass.background))
        
        return dispatchQueue
    }
    
    class func factoryDispatchSemaphore() -> DispatchSemaphore
    {
        let dispatchSemaphore:DispatchSemaphore = DispatchSemaphore(
            value:kSemaphoreCount)
        
        return dispatchSemaphore
    }
    
    func factoryViews()
    {
        let viewProgress:UIView = UIView()
        viewProgress.isUserInteractionEnabled = false
        viewProgress.translatesAutoresizingMaskIntoConstraints = false
        viewProgress.clipsToBounds = true
        viewProgress.backgroundColor = UIColor(white:1, alpha:0.6)
        viewProgress.alpha = 0
        self.viewProgress = viewProgress
        
        addSubview(viewProgress)
        
        NSLayoutConstraint.equalsVertical(
            view:viewProgress,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:viewProgress,
            toView:self)
        layoutProgressWidth = NSLayoutConstraint.width(
            view:viewProgress)
    }
}
