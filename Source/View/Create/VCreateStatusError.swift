import UIKit

final class VCreateStatusError:View<ArchCreate>
{
    private let kImageTop:CGFloat = 210
    private let kImageHeight:CGFloat = 50
    private let kLabelHeight:CGFloat = 220
    private let kFontSizeTitle:CGFloat = 22
    private let kFontSizeDescr:CGFloat = 16
    
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
        let mutableString:NSMutableAttributedString = NSMutableAttributedString()
        mutableString.append(title)
        
        if let descr:NSAttributedString = factoryMessageDescr()
        {
            mutableString.append(descr)
        }
        
        return mutableString
    }
    
    private func factoryMessageTitle() -> NSAttributedString
    {
        let attributes:[NSAttributedStringKey:Any] = [
            NSAttributedStringKey.font:
                UIFont.regular(size:kFontSizeTitle),
            NSAttributedStringKey.foregroundColor:
                UIColor.colourFail]
        let string:String = String.localizedView(
            key:"VCreateStatusError_title")
        let attributedString:NSAttributedString = NSAttributedString(
            string:string,
            attributes:attributes)
        
        return attributedString
    }
    
    private func factoryMessageDescr() -> NSAttributedString?
    {
        guard
            
            let status:MCreateStatusErrorProtocol = controller.model.status as? MCreateStatusErrorProtocol
        
        else
        {
            return nil
        }
        
        let attributes:[NSAttributedStringKey:Any] = [
            NSAttributedStringKey.font:
                UIFont.regular(size:kFontSizeDescr),
            NSAttributedStringKey.foregroundColor:
                UIColor.colourBackgroundDark]
        let attributedString:NSAttributedString = NSAttributedString(
            string:status.message,
            attributes:attributes)
        
        return attributedString
    }
}
