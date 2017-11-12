import UIKit

extension VCreateSearchList
{
    //MARK: internal
    
    func config()
    {
        backgroundColor = UIColor.white
        
        let border:VBorder = VBorder(
            colour:UIColor(white:0, alpha:0.2))
        
        addSubview(border)
        
        NSLayoutConstraint.height(
            view:border,
            constant:kBorderHeight)
        NSLayoutConstraint.bottomToBottom(
            view:border,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
    }
}
