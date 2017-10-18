import UIKit

extension VCreateStatusReadyBar
{
    //MARK: private
    
    private func animate(
        top:CGFloat,
        completion:(() -> ())?)
    {
        layoutTop.constant = top
        
        UIView.animate(
            withDuration:kAnimationDuration,
            animations:
            { [weak self] in
                
                self?.superview?.layoutIfNeeded()
            })
        { (done:Bool) in
            
            completion?()
        }
    }
    
    //MARK: internal
    
    func animateStart()
    {
        animate(top:0)
        { [weak self] in
            
            self?.controller.lightStatusBar()
        }
    }
    
    func animateFullMap()
    {
        animate(top:kMinTop, completion:nil)
    }
    
    func animateSmallMap()
    {
        animate(top:0, completion:nil)
    }
}
