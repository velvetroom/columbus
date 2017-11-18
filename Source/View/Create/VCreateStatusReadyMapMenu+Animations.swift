import UIKit

extension VCreateStatusReadyMapMenu
{
    //MARK: internal
    
    func animateShow()
    {
        UIView.animate(withDuration:ViewMain.Constants.animationDuration)
        { [weak self] in
            
            self?.alpha = 1
        }
    }
}
