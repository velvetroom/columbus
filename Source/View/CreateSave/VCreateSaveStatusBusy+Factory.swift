import UIKit

extension VCreateSaveStatusBusy
{
    //MARK: private
    
    private func factoryTitle() -> NSAttributedString
    {
        let attributes:[NSAttributedStringKey:Any] = [
            NSAttributedStringKey.font : UIFont.medium(size:VCreateSaveStatusBusy.Constants.labelFontSize),
            NSAttributedStringKey.foregroundColor : UIColor.white]
        
        let string:String = String.localizedView(key:"VCreateSaveStatusBusy_labelTitle")
        
        let attributedString:NSAttributedString = NSAttributedString(
            string:string,
            attributes:attributes)
        
        return attributedString
    }
    
    private func factoryDescr() -> NSAttributedString
    {
        let attributes:[NSAttributedStringKey:Any] = [
            NSAttributedStringKey.font : UIFont.regular(size:VCreateSaveStatusBusy.Constants.labelFontSize),
            NSAttributedStringKey.foregroundColor : UIColor(white:1, alpha:0.6)]
        
        let string:String = String.localizedView(key:"VCreateSaveStatusBusy_labelDescr")
        
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
        
        let viewGradient:VGradient = VGradient.vertical(
            colourTop:UIColor.colourGradientLight,
            colourBottom:UIColor.colourGradientDark)
        
        let viewSpinner:VSpinner = VSpinner()
        self.viewSpinner = viewSpinner
        
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
            UIColor.white,
            for:UIControlState.normal)
        buttonCancel.setTitleColor(
            UIColor(white:1, alpha:0.6),
            for:UIControlState.highlighted)
        buttonCancel.setTitle(
            String.localizedView(key:"VCreateSaveStatusBusy_buttonCancel"),
            for:UIControlState.normal)
        buttonCancel.titleLabel!.font = UIFont.regular(
            size:VCreateSaveStatusBusy.Constants.cancelFontSize)
        buttonCancel.addTarget(
            self,
            action:#selector(selectorCancel(sender:)),
            for:UIControlEvents.touchUpInside)
        
        let viewProgress:VCreateSaveStatusBusyProgress = VCreateSaveStatusBusyProgress(controller:controller)
        self.viewProgress = viewProgress
        
        addSubview(viewGradient)
        addSubview(viewProgress)
        addSubview(viewSpinner)
        addSubview(label)
        addSubview(buttonCancel)
        
        NSLayoutConstraint.equals(
            view:viewGradient,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:viewSpinner,
            toView:self)
        
        NSLayoutConstraint.bottomToBottom(
            view:label,
            toView:self,
            constant:VCreateSaveStatusBusy.Constants.labelBottom)
        NSLayoutConstraint.height(
            view:label,
            constant:VCreateSaveStatusBusy.Constants.labelHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:label,
            toView:self)
        
        NSLayoutConstraint.topToBottom(
            view:buttonCancel,
            toView:label)
        NSLayoutConstraint.height(
            view:buttonCancel,
            constant:VCreateSaveStatusBusy.Constants.cancelHeight)
        layoutCancelLeft = NSLayoutConstraint.leftToLeft(
            view:buttonCancel,
            toView:self)
        NSLayoutConstraint.width(
            view:buttonCancel,
            constant:VCreateSaveStatusBusy.Constants.cancelWidth)
        
        NSLayoutConstraint.bottomToBottom(
            view:viewProgress,
            toView:self)
        NSLayoutConstraint.height(
            view:viewProgress,
            constant:VCreateSaveStatusBusy.Constants.progressHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewProgress,
            toView:self)
    }
}
