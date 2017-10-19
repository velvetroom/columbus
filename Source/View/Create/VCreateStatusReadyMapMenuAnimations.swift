import UIKit

extension VCreateStatusReadyMapMenu
{
    //MARK: internal
    
    func animateShow()
    {
        UIView.animate(withDuration:kAnimationDuration)
        { [weak self] in
            
            self?.alpha = 1
        }
    }
}
