import UIKit

extension VHomeReadyBarListHeader
{
    //MARK: internal
    
    func factoryViews()
    {
        let border:VBorder = VBorder(colour:UIColor(white:0, alpha:0.2))
        
        addSubview(border)
        
        NSLayoutConstraint.bottomToBottom(
            view:border,
            toView:self)
        NSLayoutConstraint.height(
            view:border,
            constant:ViewMain.Constants.borderWidth)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
    }
}
