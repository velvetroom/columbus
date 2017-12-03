import UIKit

final class VCreateStatusNeedsPermission:View<ArchCreate>
{
    required init(controller:CCreate)
    {
        super.init(controller:controller)
        
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func factoryViews()
    {
        let imageView:UIImageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = UIViewContentMode.center
        imageView.clipsToBounds = true
        imageView.image = #imageLiteral(resourceName: "assetGenericLocation")
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.backgroundColor = UIColor.clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.regular(size:VCreateStatusNeedsPermission.Constants.fontSize)
        label.textColor = UIColor.colourBackgroundDark
        label.textAlignment = NSTextAlignment.center
        label.text = String.localizedView(key:"VCreateStatusNeedsPermission_label")
        
        let button:VCreateStatusNeedsPermissionContinue = VCreateStatusNeedsPermissionContinue(
            controller:controller)
        
        addSubview(imageView)
        addSubview(label)
        addSubview(button)
        
        NSLayoutConstraint.topToTop(
            view:imageView,
            toView:self,
            constant:VCreateStatusNeedsPermission.Constants.imageTop)
        NSLayoutConstraint.height(
            view:imageView,
            constant:VCreateStatusNeedsPermission.Constants.imageHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:imageView,
            toView:self)
        
        NSLayoutConstraint.topToBottom(
            view:label,
            toView:imageView)
        NSLayoutConstraint.height(
            view:label,
            constant:VCreateStatusNeedsPermission.Constants.labelHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:label,
            toView:self)
        
        NSLayoutConstraint.bottomToBottom(
            view:button,
            toView:self,
            constant:VCreateStatusNeedsPermission.Constants.buttonBottom)
        NSLayoutConstraint.height(
            view:button,
            constant:VCreateStatusNeedsPermission.Constants.buttonHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:button,
            toView:self)
    }
}
