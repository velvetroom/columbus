import UIKit

final class VCreateTravelBackground:View<ArchCreateTravel>
{
    private let kAlpha:CGFloat = 0.95
    
    required init(controller:CCreateTravel)
    {
        super.init(controller:controller)
        isUserInteractionEnabled = false
        
        let blur:VBlur = VBlur.light()
        
        addSubview(blur)
        
        NSLayoutConstraint.equals(
            view:blur,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
