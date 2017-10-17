import UIKit

final class VCreateStatusNeedsPermission:View<ArchCreate>
{
    private let kImageTop:CGFloat = 100
    private let kImageHeight:CGFloat = 50
    private let kLabelTop:CGFloat = 10
    private let kLabelHeight:CGFloat = 50
    private let kButtonTop:CGFloat = 40
    private let kButtonHeight:CGFloat = 80
    private let kFontSize:CGFloat = 16
    
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
        label.font = UIFont.regular(size:kFontSize)
        label.textColor = UIColor.colourBackgroundDark
        label.textAlignment = NSTextAlignment.center
        label.text = String.localizedView(
            key:"VCreateStatusNeedsPermission_label")
        
        addSubview(imageView)
        addSubview(label)
        
        NSLayoutConstraint.topToTop(
            view:imageView,
            toView:self,
            constant:kImageTop)
        NSLayoutConstraint.height(
            view:imageView,
            constant:kImageHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:imageView,
            toView:self)
        
        NSLayoutConstraint.topToBottom(
            view:label,
            toView:imageView,
            constant:kLabelTop)
        NSLayoutConstraint.height(
            view:label,
            constant:kLabelHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:label,
            toView:self)
    }
}
