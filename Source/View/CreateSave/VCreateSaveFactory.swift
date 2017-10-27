import UIKit

extension VCreateSave
{
    //MARK: internal
    
    func factoryViews(controller:CCreateSave)
    {
        let viewGradient:VGradient = VGradient.vertical(
            colourTop:UIColor.colourGradientLight,
            colourBottom:UIColor.colourGradientDark)
        
        let viewSpinner:VSpinner = VSpinner()
        self.viewSpinner = viewSpinner
        
        addSubview(viewGradient)
        addSubview(viewSpinner)
        
        NSLayoutConstraint.equals(
            view:viewGradient,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:viewSpinner,
            toView:self)
    }
}
