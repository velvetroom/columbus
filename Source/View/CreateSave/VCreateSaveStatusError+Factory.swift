import UIKit

extension VCreateSaveStatusError
{
    //MARK: private
    
    private func factoryTitle() -> NSAttributedString
    {
        let attributes:[NSAttributedStringKey:Any] = [
            NSAttributedStringKey.font:
                UIFont.medium(size:kTitleFontSize),
            NSAttributedStringKey.foregroundColor:
                UIColor.white]
        let string:String = String.localizedView(
            key:"VCreateSaveStatusError_labelTitle")
        let attributedString:NSAttributedString = NSAttributedString(
            string:string,
            attributes:attributes)
        
        return attributedString
    }
    
    private func factoryDescr() -> NSAttributedString
    {
        let attributes:[NSAttributedStringKey:Any] = [
            NSAttributedStringKey.font:
                UIFont.regular(size:kDescrFontSize),
            NSAttributedStringKey.foregroundColor:
                UIColor(white:1, alpha:0.8)]
        let string:String = String.localizedView(
            key:"VCreateSaveStatusError_labelDescr")
        let attributedString:NSAttributedString = NSAttributedString(
            string:string,
            attributes:attributes)
        
        return attributedString
    }
    
    private func factoryInfo() -> NSAttributedString
    {
        let title:NSAttributedString = factoryTitle()
        let descr:NSAttributedString = factoryDescr()
        
        let mutableString:NSMutableAttributedString = NSMutableAttributedString()
        mutableString.append(title)
        mutableString.append(descr)
        
        return mutableString
    }
    
    //MARK: internal
    
    func factoryViews()
    {
        let info:NSAttributedString = factoryInfo()
        
        let colourTop:UIColor = UIColor(
            red:1,
            green:0.4352941176470589,
            blue:0.5686274509803924,
            alpha:1)
        
        let viewGradient:VGradient = VGradient.vertical(
            colourTop:colourTop,
            colourBottom:UIColor.colourFail)
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.center
        label.numberOfLines = 0
        label.attributedText = info
        
        let buttonCancel:UIButton = UIButton()
        buttonCancel.translatesAutoresizingMaskIntoConstraints = false
        buttonCancel.setTitleColor(
            UIColor(white:1, alpha:0.9),
            for:UIControlState.normal)
        buttonCancel.setTitleColor(
            UIColor(white:1, alpha:0.2),
            for:UIControlState.highlighted)
        buttonCancel.setTitle(
            String.localizedView(
                key:"VCreateSaveStatusError_buttonCancel"),
            for:UIControlState.normal)
        buttonCancel.titleLabel!.font = UIFont.regular(
            size:kCancelFontSize)
        buttonCancel.addTarget(
            self,
            action:#selector(selectorCancel(sender:)),
            for:UIControlEvents.touchUpInside)
        
        let buttonRetry:UIButton = UIButton()
        buttonRetry.translatesAutoresizingMaskIntoConstraints = false
        buttonRetry.setTitleColor(
            UIColor.white,
            for:UIControlState.normal)
        buttonRetry.setTitleColor(
            UIColor(white:1, alpha:0.2),
            for:UIControlState.highlighted)
        buttonRetry.setTitle(
            String.localizedView(
                key:"VCreateSaveStatusError_buttonRetry"),
            for:UIControlState.normal)
        buttonRetry.titleLabel!.font = UIFont.bold(
            size:kRetryFontSize)
        buttonRetry.addTarget(
            self,
            action:#selector(selectorRetry(sender:)),
            for:UIControlEvents.touchUpInside)
        
        let image:UIImageView = UIImageView()
        image.isUserInteractionEnabled = false
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = UIViewContentMode.center
        image.image = #imageLiteral(resourceName: "assetGenericError").withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        image.tintColor = UIColor.white
        
        addSubview(viewGradient)
        addSubview(label)
        addSubview(buttonCancel)
        addSubview(buttonRetry)
        addSubview(image)
        
        NSLayoutConstraint.equals(
            view:viewGradient,
            toView:self)
        
        NSLayoutConstraint.bottomToBottom(
            view:label,
            toView:self,
            constant:kLabelBottom)
        NSLayoutConstraint.height(
            view:label,
            constant:kLabelHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:label,
            toView:self)
        
        NSLayoutConstraint.topToBottom(
            view:buttonCancel,
            toView:buttonRetry)
        NSLayoutConstraint.height(
            view:buttonCancel,
            constant:kButtonHeight)
        layoutCancelLeft = NSLayoutConstraint.leftToLeft(
            view:buttonCancel,
            toView:self)
        NSLayoutConstraint.width(
            view:buttonCancel,
            constant:kButtonWidth)
        
        NSLayoutConstraint.topToBottom(
            view:buttonRetry,
            toView:label)
        NSLayoutConstraint.height(
            view:buttonRetry,
            constant:kButtonHeight)
        layoutRetryLeft = NSLayoutConstraint.leftToLeft(
            view:buttonRetry,
            toView:self)
        NSLayoutConstraint.width(
            view:buttonRetry,
            constant:kButtonWidth)
        
        NSLayoutConstraint.bottomToTop(
            view:image,
            toView:label)
        NSLayoutConstraint.height(
            view:image,
            constant:kImageHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:image,
            toView:self)
    }
}
