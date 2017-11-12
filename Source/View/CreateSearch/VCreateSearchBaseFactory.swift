import UIKit

extension VCreateSearchBase
{
    //MARK: internal
    
    func factoryViews()
    {
        let border:VBorder = VBorder(
            colour:UIColor(white:0, alpha:0.2))
        
        let viewList:VCreateSearchBaseList = VCreateSearchBaseList(
            controller:controller)
        self.viewList = viewList
        
        addSubview(border)
        addSubview(viewList)
        
        NSLayoutConstraint.bottomToBottom(
            view:border,
            toView:self)
        NSLayoutConstraint.height(
            view:border,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:viewList,
            toView:self)
    }
}
