import UIKit

final class VCreateStatusReadyBarLoader:
    View<ArchCreate>
{
    weak var viewProgress:UIView!
    weak var layoutProgressWidth:NSLayoutConstraint!
    private let dispatchQueue:DispatchQueue
    private let dispatchSemaphore:DispatchSemaphore
    private let kAnimationDuration:TimeInterval = 10
    private let kFadeDuration:TimeInterval = 0.3
    
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
