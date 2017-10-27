import UIKit

extension VCreateSave
{
    //MARK: internal
    
    func factoryViews(controller:CCreateSave)
    {
        let viewGradient:VGradient = VGradient.vertical(
            colourTop:UIColor.colourGradientLight,
            colourBottom:UIColor.colourGradientDark)
        
        let viewSpinner:VSpinner = VSpinner()
        self.viewSpinner = viewSpinner
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.textAlignment = NSTextAlignment.center
        labelTitle.font = UIFont.regular(size:kTitleFontSize)
        labelTitle.textColor = UIColor.white
        labelTitle.text = String.localizedView(
            key:"VCreateSave_labelTitle")
        
        let buttonCancel:UIButton = UIButton()
        buttonCancel.translatesAutoresizingMaskIntoConstraints = false
        buttonCancel.setTitleColor(
            UIColor.white,
            for:UIControlState.normal)
        buttonCancel.setTitleColor(
            UIColor(white:1, alpha:0.4),
            for:UIControlState.highlighted)
        buttonCancel.setTitle(
            String.localizedView(
                key:"VCreateSave_buttonCancel"),
            for:UIControlState.normal)
        buttonCancel.titleLabel!.font = UIFont.regular(
            size:kCancelFontSize)
        buttonCancel.addTarget(
            self,
            action:#selector(selectorCancel(sender:)),
            for:UIControlEvents.touchUpInside)
        
        addSubview(viewGradient)
        addSubview(viewSpinner)
        addSubview(labelTitle)
        addSubview(buttonCancel)
        
        NSLayoutConstraint.equals(
            view:viewGradient,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:viewSpinner,
            toView:self)
        
        NSLayoutConstraint.bottomToBottom(
            view:labelTitle,
            toView:self,
            constant:kTitleHeight)
        NSLayoutConstraint.height(
            view:labelTitle,
            constant:kTitleHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:labelTitle,
            toView:self)
        
        NSLayoutConstraint.topToBottom(
            view:buttonCancel,
            toView:labelTitle)
        NSLayoutConstraint.height(
            view:buttonCancel,
            constant:kCancelHeight)
        layoutCancelLeft = NSLayoutConstraint.leftToLeft(
            view:buttonCancel,
            toView:self)
        NSLayoutConstraint.width(
            view:buttonCancel,
            constant:kCancelWidth)
    }
}
