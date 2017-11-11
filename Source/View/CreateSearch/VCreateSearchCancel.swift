import UIKit

final class VCreateSearchCancel:View<ArchCreateSearch>
{
    required init(controller:CCreateSearch)
    {
        super.init(controller:controller)
        
        let blur:VBlur = VBlur.light()
        
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(
            self,
            action:#selector(selectorButton(sender:)),
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
    private func selectorButton(sender button:UIButton)
    {
        controller.back()
    }
}
