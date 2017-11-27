import UIKit

final class VHomeReady:View<ArchHome>
{
    weak var viewMap:VHomeReadyMap!
    weak var viewBar:VHomeReadyBar!
    weak var viewMenu:VHomeReadyMenu!
    weak var layoutBarBottom:NSLayoutConstraint!
    
    required init(controller:CHome)
    {
        super.init(controller:controller)
        
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: internal
    
    func toast(message:String)
    {
        let height:CGFloat = viewMap.bounds.height
        let remainHeight:CGFloat = height - VHomeReady.Constants.toastHeight
        let marginTop:CGFloat = remainHeight / 2.0
        
        let viewToast:VHomeReadyToast = VHomeReadyToast(message:message)
        
        addSubview(viewToast)
        
        NSLayoutConstraint.topToTop(
            view:viewToast,
            toView:viewMap,
            constant:marginTop)
        NSLayoutConstraint.height(
            view:viewToast,
            constant:VHomeReady.Constants.toastHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewToast,
            toView:self)
    }
}
