import UIKit

extension VCreateSearch
{
    //MARK: internal
    
    func factoryViews(controller:CCreateSearch)
    {
        let blur:VBlur = VBlur.light()
        
        addSubview(blur)
        
        NSLayoutConstraint.equals(
            view:blur,
            toView:self)
    }
}
