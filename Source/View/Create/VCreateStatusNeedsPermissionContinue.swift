import UIKit

final class VCreateStatusNeedsPermissionContinue:
    View<ArchCreate>
{
    private weak var layoutButtonLeft:NSLayoutConstraint!
    private let kButtonWidth:CGFloat = 200
    
    required init(controller:CCreate)
    {
        super.init(controller:controller)
        
        let background:UIImageView = UIImageView()
        background.translatesAutoresizingMaskIntoConstraints = false
        background.isUserInteractionEnabled = false
        background.clipsToBounds = true
        background.contentMode = UIViewContentMode.center
        background.image = #imageLiteral(resourceName: "assetGenericButton")
        
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(
            String.localizedView(key:"VCreateStatusNeedsPermissionContinue_button"),
            for:UIControlState.normal)
        button.setTitleColor(
            UIColor.white,
            for:UIControlState.normal)
        button.setTitleColor(
            UIColor(white:1, alpha:0.2),
            for:UIControlState.highlighted)
        button.titleLabel!.font = UIFont.medium(size:16)
        button.addTarget(
            self,
            action:#selector(selectorButton(sender:)),
            for:UIControlEvents.touchUpInside)
        
        addSubview(background)
        addSubview(button)
        
        NSLayoutConstraint.equals(
            view:background,
            toView:self)
        
        NSLayoutConstraint.equalsVertical(
            view:button,
            toView:self)
        NSLayoutConstraint.width(
            view:button,
            constant:kButtonWidth)
        layoutButtonLeft = NSLayoutConstraint.leftToLeft(
            view:button,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = bounds.width
        let remainWidth:CGFloat = width - kButtonWidth
        let buttonLeft:CGFloat = remainWidth / 2.0
        layoutButtonLeft.constant = buttonLeft
        
        super.layoutSubviews()
    }
    
    //MARK: selectors
    
    @objc
    private func selectorButton(sender button:UIButton)
    {
        
    }
}

