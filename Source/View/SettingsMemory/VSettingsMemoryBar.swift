import UIKit

final class VSettingsMemoryBar:View<ArchSettingsMemory>
{
    private let kTitleTop:CGFloat = 20
    private let kBorderHeight:CGFloat = 1
    private let kFontSize:CGFloat = 14
    
    required init(controller:CSettingsMemory)
    {
        super.init(controller:controller)
        backgroundColor = UIColor.white
        
        let border:VBorder = VBorder(
            colour:UIColor(white:0, alpha:0.2))
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.textAlignment = NSTextAlignment.center
        labelTitle.font = UIFont.medium(size:kFontSize)
        labelTitle.textColor = UIColor.colourBackgroundDark
        labelTitle.text = String.localizedView(
            key:"VSettingsMemoryBar_labelTitle")
        
        let backButton:UIButton = UIButton()
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(
            #imageLiteral(resourceName: "assetGenericBack"),
            for:UIControlState.normal)
        backButton.setImage(
            #imageLiteral(resourceName: "assetGenericBack").withRenderingMode(UIImageRenderingMode.alwaysTemplate),
            for:UIControlState.highlighted)
        backButton.imageView!.tintColor = UIColor.colourBackgroundGray
        backButton.imageView!.contentMode = UIViewContentMode.center
        backButton.addTarget(
            self,
            action:#selector(selectorBack(sender:)),
            for:UIControlEvents.touchUpInside)
        
        addSubview(border)
        addSubview(labelTitle)
        addSubview(backButton)
        
        NSLayoutConstraint.bottomToBottom(
            view:border,
            toView:self)
        NSLayoutConstraint.height(
            view:border,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:labelTitle,
            toView:self,
            constant:kTitleTop)
        NSLayoutConstraint.bottomToBottom(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:labelTitle,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: selectors
    
    @objc
    private func selectorBack(sender button:UIButton)
    {
        controller.back()
    }
}
