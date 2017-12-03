import UIKit

extension VCreateStatusReadyBar
{
    //MARK: internal
    
    func animate(
        top:CGFloat,
        completion:(() -> ())?)
    {
        layoutTop.constant = top
        
        UIView.animate(withDuration:ViewMain.Constants.animationDuration,
        animations:
        { [weak self] in
            
            self?.superview?.layoutIfNeeded()
        })
        { (done:Bool) in
            
            completion?()
        }
    }
}
