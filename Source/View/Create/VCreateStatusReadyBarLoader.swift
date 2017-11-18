import UIKit

final class VCreateStatusReadyBarLoader:View<ArchCreate>
{
    weak var viewProgress:UIView!
    weak var layoutProgressWidth:NSLayoutConstraint!
    let dispatchQueue:DispatchQueue
    let dispatchSemaphore:DispatchSemaphore
    
    required init(controller:CCreate)
    {
        dispatchQueue = VCreateStatusReadyBarLoader.factoryDispatchQueue()
        dispatchSemaphore = VCreateStatusReadyBarLoader.factoryDispatchSemaphore()
        
        super.init(controller:controller)
        isUserInteractionEnabled = false
        
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
