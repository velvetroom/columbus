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
        
        addSubview(border)
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
        
        NSLayoutConstraint.equalsVertical(
            view:viewStops,
            toView:self,
            margin:kContentMarginVertical)
        NSLayoutConstraint.equalsHorizontal(
            view:viewStops,
            toView:self)
        
        NSLayoutConstraint.equalsVertical(
            view:viewTravel,
            toView:self,
            margin: kContentMarginVertical)
        NSLayoutConstraint.leftToLeft(
            view:viewTravel,
            toView:self)
        NSLayoutConstraint.width(
            view:viewTravel,
            constant:kTravelWidth)
    }
}
