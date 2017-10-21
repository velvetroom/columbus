import UIKit

extension VCreateStatusReadyBar
{
    //MARK: internal
    
    func factoryViews()
    {
        let border:VBorder = VBorder(
            colour:UIColor(white:0, alpha:0.4))
        
        let viewStops:VCreateStatusReadyBarStops = VCreateStatusReadyBarStops(
            controller:controller)
        self.viewStops = viewStops
        
        let viewTravel:VCreateStatusReadyBarTravel = VCreateStatusReadyBarTravel(
            controller:controller)
        self.viewTravel = viewTravel
        
        let viewLoader:VCreateStatusReadyBarLoader = VCreateStatusReadyBarLoader(
            controller:controller)
        self.viewLoader = viewLoader
        
        addSubview(border)
        addSubview(viewLoader)
        addSubview(viewStops)
        addSubview(viewTravel)
        
        NSLayoutConstraint.bottomToBottom(
            view:border,
            toView:self)
        NSLayoutConstraint.height(
            view:border,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
        
        NSLayoutConstraint.bottomToTop(
            view:viewLoader,
            toView:border)
        NSLayoutConstraint.height(
            view:viewLoader,
            constant:kLoaderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewLoader,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:viewStops,
            toView:self,
            constant:kContentTop)
        NSLayoutConstraint.bottomToBottom(
            view:viewStops,
            toView:self,
            constant:kContentBottom)
        NSLayoutConstraint.equalsHorizontal(
            view:viewStops,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:viewTravel,
            toView:self,
            constant:kContentTop)
        NSLayoutConstraint.bottomToBottom(
            view:viewTravel,
            toView:self,
            constant:kContentBottom)
        NSLayoutConstraint.leftToLeft(
            view:viewTravel,
            toView:self)
        NSLayoutConstraint.width(
            view:viewTravel,
            constant:kTravelWidth)
    }
}
