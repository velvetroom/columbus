import UIKit

final class VCreateStatusReadyBarLoader:
    View<ArchCreate>
{
    private weak var viewProgress:UIView!
    private weak var layoutProgressWidth:NSLayoutConstraint!
    private let dispatchQueue:DispatchQueue
    private let dispatchSemaphore:DispatchSemaphore
    private let kQueueName:String = "iturbide.columbus.loader"
    private let kAnimationDuration:TimeInterval = 10
    private let kFadeDuration:TimeInterval = 0.3
    
    required init(controller:CCreate)
    {
        dispatchQueue = DispatchQueue(
            label:kQueueName,
            qos:DispatchQoS.background,
            attributes:DispatchQueue.Attributes(),
            autoreleaseFrequency:
            DispatchQueue.AutoreleaseFrequency.inherit,
            target:DispatchQueue.global(
                qos:DispatchQoS.QoSClass.background))
        
        dispatchSemaphore = DispatchSemaphore(
            value:1)
        
        super.init(controller:controller)
        isUserInteractionEnabled = false
        
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
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func semaphoreSignaled()
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.asyncLoadProgress()
        }
    }
    
    private func asyncLoadProgress()
    {
        layer.removeAllAnimations()
        viewProgress.layer.removeAllAnimations()
        
        layoutProgressWidth.constant = 0
        layoutIfNeeded()
        animateProgress()
    }
    
    private func animateProgress()
    {
        viewProgress.alpha = 1
        layoutProgressWidth.constant = bounds.width
        
        UIView.animate(
            withDuration:kAnimationDuration,
            animations:
        { [weak self] in
            
            self?.layoutIfNeeded()
        })
        { [weak self] (done:Bool) in
            
            self?.animateFade()
        }
    }
    
    private func animateFade()
    {
        UIView.animate(
            withDuration:kFadeDuration,
        animations:
        { [weak self] in
            
            self?.viewProgress.alpha = 0
        })
        { [weak self] (done:Bool) in
            
            self?.dispatchSemaphore.signal()
        }
    }
    
    //MARK: internal
    
    func loadProgress()
    {
        dispatchQueue.async
        { [weak self] in
            
            self?.dispatchSemaphore.wait()
            self?.semaphoreSignaled()
        }
    }
}
