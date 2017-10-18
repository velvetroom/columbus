import UIKit

extension VCreateStatusReadyBar
{
    //MARK: internal
    
    func factoryViews()
    {
        let border:VBorder = VBorder(
            colour:UIColor(white:0, alpha:0.4))
        
        addSubview(border)
        
        NSLayoutConstraint.bottomToBottom(
            view:border,
            toView:self)
        NSLayoutConstraint.height(
            view:border,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
    }
}
