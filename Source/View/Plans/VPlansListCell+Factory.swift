import UIKit

extension VPlansListCell
{
    //MARK: internal
    
    class func factoryDateFormatter() -> DateFormatter
    {
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.none
        dateFormatter.dateStyle = DateFormatter.Style.medium
        
        return dateFormatter
    }
    
    func factoryViews()
    {
        let imageRoute:UIImageView = UIImageView()
        imageRoute.isUserInteractionEnabled = false
        imageRoute.translatesAutoresizingMaskIntoConstraints = false
        imageRoute.clipsToBounds = true
        imageRoute.contentMode = UIViewContentMode.center
        imageRoute.image = #imageLiteral(resourceName: "assetPlansRoute").withRenderingMode(
            UIImageRenderingMode.alwaysTemplate)
        self.imageRoute = imageRoute
        
        let labelOrigin:UILabel = UILabel()
        labelOrigin.isUserInteractionEnabled = false
        labelOrigin.translatesAutoresizingMaskIntoConstraints = false
        labelOrigin.backgroundColor = UIColor.clear
        labelOrigin.font = UIFont.regular(size:VPlansListCell.Constants.routeFontSize)
        self.labelOrigin = labelOrigin
        
        let labelDestination:UILabel = UILabel()
        labelDestination.isUserInteractionEnabled = false
        labelDestination.translatesAutoresizingMaskIntoConstraints = false
        labelDestination.backgroundColor = UIColor.clear
        labelDestination.font = UIFont.regular(size:VPlansListCell.Constants.routeFontSize)
        self.labelDestination = labelDestination
        
        let labelCreated:UILabel = UILabel()
        labelCreated.isUserInteractionEnabled = false
        labelCreated.translatesAutoresizingMaskIntoConstraints = false
        labelCreated.backgroundColor = UIColor.clear
        labelCreated.font = UIFont.regular(size:VPlansListCell.Constants.createdFontSize)
        self.labelCreated = labelCreated
        
        addSubview(imageRoute)
        addSubview(labelOrigin)
        addSubview(labelDestination)
        addSubview(labelCreated)
        
        NSLayoutConstraint.topToTop(
            view:imageRoute,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:imageRoute,
            toView:self)
        NSLayoutConstraint.width(
            view:imageRoute,
            constant:VPlansListCell.Constants.routeWidth)
        NSLayoutConstraint.height(
            view:imageRoute,
            constant:VPlansListCell.Constants.routeHeight)
        
        NSLayoutConstraint.topToTop(
            view:labelOrigin,
            toView:self,
            constant:VPlansListCell.Constants.labelOriginTop)
        NSLayoutConstraint.height(
            view:labelOrigin,
            constant:VPlansListCell.Constants.labelRouteHeight)
        NSLayoutConstraint.leftToRight(
            view:labelOrigin,
            toView:imageRoute)
        NSLayoutConstraint.rightToRight(
            view:labelOrigin,
            toView:self,
            constant:-VPlansListCell.Constants.buttonWidth)
        
        NSLayoutConstraint.topToBottom(
            view:labelDestination,
            toView:labelOrigin,
            constant:VPlansListCell.Constants.labelDestinationTop)
        NSLayoutConstraint.height(
            view:labelDestination,
            constant:VPlansListCell.Constants.labelRouteHeight)
        NSLayoutConstraint.leftToRight(
            view:labelDestination,
            toView:imageRoute)
        NSLayoutConstraint.rightToRight(
            view:labelDestination,
            toView:self,
            constant:-VPlansListCell.Constants.buttonWidth)
        
        NSLayoutConstraint.bottomToBottom(
            view:labelCreated,
            toView:self)
        NSLayoutConstraint.height(
            view:labelCreated,
            constant:VPlansListCell.Constants.createdHeight)
        NSLayoutConstraint.leftToLeft(
            view:labelCreated,
            toView:self,
            constant:VPlansListCell.Constants.routeWidth)
    }
    
    func factoryButton(
        controller:CPlans)
    {
        guard
        
            self.viewButton == nil
        
        else
        {
            return
        }
        
        let viewButton:VPlansListCellButton = VPlansListCellButton(
            controller:controller)
        self.viewButton = viewButton
        
        addSubview(viewButton)
        
        NSLayoutConstraint.equalsVertical(
            view:viewButton,
            toView:self,
            margin:VPlansListCell.Constants.buttonMarginVertical)
        NSLayoutConstraint.rightToRight(
            view:viewButton,
            toView:self)
        NSLayoutConstraint.width(
            view:viewButton,
            constant:VPlansListCell.Constants.buttonWidth)
    }
}
