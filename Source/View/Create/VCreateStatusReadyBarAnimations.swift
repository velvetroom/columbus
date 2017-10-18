import UIKit

extension VCreateStatusReadyBar
{
    //MARK: private
    
    private func animate(
        height:CGFloat,
        completion:(() -> ())?)
    {
        layoutHeight.constant = height
        
        UIView.animate(
            withDuration:kAnimationDuration,
            animations:
            { [weak self] in
                
                self?.layoutIfNeeded()
            })
        { (done:Bool) in
            
            completion?()
        }
    }
    
    //MARK: internal
    
    func animateStart()
    {
        animate(height:kMaxHeight)
        { [weak self] in
            
            self?.controller.lightStatusBar()
        }
    }
    
    func animateFullMap()
    {
        animate(height:kMinHeight, completion:nil)
    }
    
    func animateSmallMap()
    {
        animate(height:kMaxHeight, completion:nil)
    }
}
