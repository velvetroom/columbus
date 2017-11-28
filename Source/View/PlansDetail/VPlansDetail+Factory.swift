import UIKit

extension VPlansDetail
{
    //MARK: internal
    
    func factoryViews(controller:CPlansDetail)
    {
        let viewBar:VPlansDetailBar = VPlansDetailBar(controller:controller)
        
        addSubview(viewBar)
        
        NSLayoutConstraint.topToTop(
            view:viewBar,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBar,
            constant:ViewMain.Constants.barHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self)
    }
}
