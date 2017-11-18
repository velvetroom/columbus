import UIKit

extension VCreateSearch
{
    //MARK: internal
    
    func animateShow()
    {
        viewBase.layoutTop.constant = 0
        
        UIView.animate(
            withDuration:kAnimationDuration,
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
        viewBase.layoutTop.constant = -viewBase.kHeight
        
        UIView.animate(withDuration:kAnimationDuration)
        { [weak self] in
            
            self?.layoutIfNeeded()
        }
    }
}
