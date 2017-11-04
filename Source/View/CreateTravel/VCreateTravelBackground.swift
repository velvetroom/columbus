import UIKit

final class VCreateTravelBackground:View<ArchCreateTravel>
{
    private let kAlpha:CGFloat = 0.95
    
    required init(controller:CCreateTravel)
    {
        super.init(controller:controller)
        
        let blur:VBlur = VBlur.light()
        
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(
            self,
            action:#selector(selectorCancel(sender:)),
            for:UIControlEvents.touchUpInside)
        
        addSubview(blur)
        addSubview(button)
        
        NSLayoutConstraint.equals(
            view:blur,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:button,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: selectors
    
    @objc
    private func selectorCancel(sender button:UIButton)
    {
        controller.back()
    }
}
