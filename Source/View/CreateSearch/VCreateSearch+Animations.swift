import UIKit

extension VCreateSearch
{
    //MARK: internal
    
    func animateShow()
    {
        viewBase.layoutTop.constant = 0
        
        UIView.animate(withDuration:ViewMain.Constants.animationDuration,
        animations:
        { [weak self] in
            
            self?.layoutIfNeeded()
        })
        { [weak self] (done:Bool) in
            
            self?.viewBase.viewBar.searchBar.becomeFirstResponder()
        }
    }
    
    func animateHide()
    {
        viewBase.layoutTop.constant = -VCreateSearchBase.Constants.height
        
        UIView.animate(withDuration:ViewMain.Constants.animationDuration)
        { [weak self] in
            
            self?.layoutIfNeeded()
        }
    }
}
