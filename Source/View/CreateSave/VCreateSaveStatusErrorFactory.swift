import UIKit

extension VCreateSaveStatusError
{
    //MARK: private
    
    private func factoryTitle() -> NSAttributedString
    {
        let attributes:[NSAttributedStringKey:Any] = [
            NSAttributedStringKey.font:
                UIFont.medium(size:kLabelFontSize),
            NSAttributedStringKey.foregroundColor:
                UIColor.colourBackgroundDark]
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
                UIFont.regular(size:kLabelFontSize),
            NSAttributedStringKey.foregroundColor:
                UIColor(white:0, alpha:0.5)]
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
            UIColor(white:0, alpha:0.5),
            for:UIControlState.normal)
        buttonCancel.setTitleColor(
            UIColor.colourBackgroundGray,
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
            UIColor.colourBackgroundDark,
            for:UIControlState.normal)
        buttonRetry.setTitleColor(
            UIColor.colourBackgroundGray,
            for:UIControlState.highlighted)
        buttonRetry.setTitle(
            String.localizedView(
                key:"VCreateSaveStatusError_buttonRetry"),
            for:UIControlState.normal)
        buttonRetry.titleLabel!.font = UIFont.medium(
            size:kRetryFontSize)
        buttonRetry.addTarget(
            self,
            action:#selector(selectorRetry(sender:)),
            for:UIControlEvents.touchUpInside)
        
        addSubview(label)
        addSubview(buttonCancel)
        addSubview(buttonRetry)
        
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
            constant:kCancelHeight)
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
            constant:kCancelHeight)
        layoutRetryLeft = NSLayoutConstraint.leftToLeft(
            view:buttonRetry,
            toView:self)
        NSLayoutConstraint.width(
            view:buttonRetry,
            constant:kButtonWidth)
    }
}
