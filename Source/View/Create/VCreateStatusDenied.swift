import UIKit

final class VCreateStatusDenied:View<ArchCreate>
{
    private let kImageTop:CGFloat = 210
    private let kImageHeight:CGFloat = 50
    private let kLabelHeight:CGFloat = 150
    private let kFontSizeTitle:CGFloat = 18
    private let kFontSizeDescr:CGFloat = 15
    
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
        let message:NSAttributedString = factoryMessage()
        
        let imageView:UIImageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = UIViewContentMode.center
        imageView.clipsToBounds = true
        imageView.image = #imageLiteral(resourceName: "assetGenericError")
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.backgroundColor = UIColor.clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.center
        label.attributedText = message
        
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
            toView:imageView)
        NSLayoutConstraint.height(
            view:label,
            constant:kLabelHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:label,
            toView:self)
    }
    
    private func factoryMessage() -> NSAttributedString
    {
        let title:NSAttributedString = factoryMessageTitle()
        let descr:NSAttributedString = factoryMessageDescr()
        
        let mutableString:NSMutableAttributedString = NSMutableAttributedString()
        mutableString.append(title)
        mutableString.append(descr)
        
        return mutableString
    }
    
    private func factoryMessageTitle() -> NSAttributedString
    {
        let attributes:[NSAttributedStringKey:Any] = [
            NSAttributedStringKey.font:
                UIFont.regular(size:kFontSizeTitle),
            NSAttributedStringKey.foregroundColor:
                UIColor.colourBackgroundDark]
        let string:String = String.localizedView(
            key:"VCreateStatusDenied_title")
        let attributedString:NSAttributedString = NSAttributedString(
            string:string,
            attributes:attributes)
        
        return attributedString
    }
    
    private func factoryMessageDescr() -> NSAttributedString
    {
        let attributes:[NSAttributedStringKey:Any] = [
            NSAttributedStringKey.font:
                UIFont.light(size:kFontSizeDescr),
            NSAttributedStringKey.foregroundColor:
                UIColor.colourBackgroundDark]
        let string:String = String.localizedView(
            key:"VCreateStatusDenied_descr")
        let attributedString:NSAttributedString = NSAttributedString(
            string:string,
            attributes:attributes)
        
        return attributedString
    }
}
