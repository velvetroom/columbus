import UIKit

extension VCreateStatusReadyBarLoader
{
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
        
        UIView.animate(withDuration:VCreateStatusReadyBarLoader.Constants.UI.animationDuration,
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
        UIView.animate(withDuration:VCreateStatusReadyBarLoader.Constants.UI.fadeDuration,
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
