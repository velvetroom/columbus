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
        
        let labelOrigin:UILabel = UILabel()
        labelOrigin.isUserInteractionEnabled = false
        labelOrigin.translatesAutoresizingMaskIntoConstraints = false
        labelOrigin.backgroundColor = UIColor.clear
        labelOrigin.font = UIFont.regular(size:kRouteFontSize)
        labelOrigin.textColor = UIColor.colourBackgroundDark
        self.labelOrigin = labelOrigin
        
        let labelDestination:UILabel = UILabel()
        labelDestination.isUserInteractionEnabled = false
        labelDestination.translatesAutoresizingMaskIntoConstraints = false
        labelDestination.backgroundColor = UIColor.clear
        labelDestination.font = UIFont.regular(size:kRouteFontSize)
        labelDestination.textColor = UIColor.colourBackgroundDark
        self.labelDestination = labelDestination
        
        addSubview(imageRoute)
        addSubview(labelOrigin)
        addSubview(labelDestination)
        
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
        
        NSLayoutConstraint.topToTop(
            view:labelOrigin,
            toView:self,
            constant:kLabelOriginTop)
        NSLayoutConstraint.height(
            view:labelOrigin,
            constant:kLabelRouteHeight)
        NSLayoutConstraint.leftToRight(
            view:labelOrigin,
            toView:imageRoute)
        NSLayoutConstraint.rightToRight(
            view:labelOrigin,
            toView:self,
            constant:kLabelRouteRight)
        
        NSLayoutConstraint.topToBottom(
            view:labelDestination,
            toView:labelOrigin,
            constant:kLabelDestinationTop)
        NSLayoutConstraint.height(
            view:labelDestination,
            constant:kLabelRouteHeight)
        NSLayoutConstraint.leftToRight(
            view:labelDestination,
            toView:imageRoute)
        NSLayoutConstraint.rightToRight(
            view:labelDestination,
            toView:self,
            constant:kLabelRouteRight)
    }
}
