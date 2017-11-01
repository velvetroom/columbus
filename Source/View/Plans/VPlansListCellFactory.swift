import UIKit

extension VPlansListCell
{
    //MARK: internal
    
    func factoryViews()
    {
        let imageRoute:UIImageView = UIImageView()
        imageRoute.isUserInteractionEnabled = false
        imageRoute.translatesAutoresizingMaskIntoConstraints = false
        imageRoute.clipsToBounds = true
        imageRoute.contentMode = UIViewContentMode.center
        imageRoute.image = #imageLiteral(resourceName: "assetPlansRoute")
        
        addSubview(imageRoute)
        
        NSLayoutConstraint.topToTop(
            view:imageRoute,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:imageRoute,
            toView:self)
        NSLayoutConstraint.width(
            view:imageRoute,
            constant:kRouteWidth)
        NSLayoutConstraint.height(
            view:imageRoute,
            constant:kRouteHeight)
    }
}
