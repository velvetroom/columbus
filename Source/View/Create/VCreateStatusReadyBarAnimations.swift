import UIKit

extension VCreateStatusReadyBar
{
    static let kMinTop:CGFloat = -310
    
    //MARK: internal
    
    func animate(
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
    
    func animateStart()
    {
        animate(top:0)
        { [weak self] in
            
            self?.controller.lightStatusBar()
        }
    }
}
