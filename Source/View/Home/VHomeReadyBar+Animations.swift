import UIKit

extension VHomeReadyBar
{
    //MARK: internal
    
    func animate(
        bottom:CGFloat,
        completion:(() -> ())?)
    {
        layoutBottom.constant = bottom
        
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
