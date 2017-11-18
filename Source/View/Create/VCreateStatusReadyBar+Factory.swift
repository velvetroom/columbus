import UIKit

extension VCreateStatusReadyBar
{
    //MARK: internal
    
    func factoryViews()
    {
        let border:VBorder = VBorder(colour:UIColor(white:0, alpha:0.4))
        
        let viewTravel:VCreateStatusReadyBarTravel = VCreateStatusReadyBarTravel(controller:controller)
        self.viewTravel = viewTravel
        
        let viewStops:VCreateStatusReadyBarStops = VCreateStatusReadyBarStops(controller:controller)
        viewStops.viewTravel = viewTravel
        self.viewStops = viewStops
        
        let viewLoader:VCreateStatusReadyBarLoader = VCreateStatusReadyBarLoader(controller:controller)
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
            constant:ViewMain.Constants.borderWidth)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
        
        NSLayoutConstraint.bottomToTop(
            view:viewLoader,
            toView:border)
        NSLayoutConstraint.height(
            view:viewLoader,
            constant:VCreateStatusReadyBar.Constants.loaderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewLoader,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:viewStops,
            toView:self,
            constant:VCreateStatusReadyBar.Constants.contentTop)
        NSLayoutConstraint.bottomToBottom(
            view:viewStops,
            toView:self,
            constant:VCreateStatusReadyBar.Constants.contentBottom)
        NSLayoutConstraint.equalsHorizontal(
            view:viewStops,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:viewTravel,
            toView:self,
            constant:VCreateStatusReadyBar.Constants.contentTop)
        NSLayoutConstraint.bottomToBottom(
            view:viewTravel,
            toView:self,
            constant:VCreateStatusReadyBar.Constants.contentBottom)
        NSLayoutConstraint.leftToLeft(
            view:viewTravel,
            toView:self)
        NSLayoutConstraint.width(
            view:viewTravel,
            constant:VCreateStatusReadyBar.Constants.travelWidth)
    }
}
