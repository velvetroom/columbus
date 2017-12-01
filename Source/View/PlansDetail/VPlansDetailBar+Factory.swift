import UIKit

extension VPlansDetailBar
{
    //MARK: internal
    
    func factoryViews()
    {
        let border:VBorder = VBorder(colour:UIColor(white:0, alpha:0.2))
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.textAlignment = NSTextAlignment.center
        labelTitle.font = UIFont.medium(size:VPlansDetailBar.Constants.fontSize)
        labelTitle.textColor = UIColor.colourBackgroundDark
        labelTitle.text = String.localizedView(key:"VPlansDetailBar_labelTitle")
        
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
        
        let deleteButton:UIButton = UIButton()
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.setTitle(
            String.localizedView(key:"VPlansDetailBar_deleteButton"),
            for:UIControlState.normal)
        deleteButton.setTitleColor(
            UIColor.colourFail,
            for:UIControlState.normal)
        deleteButton.setTitleColor(
            UIColor.colourBackgroundDark,
            for:UIControlState.highlighted)
        deleteButton.titleLabel!.font = UIFont.medium(size:VPlansDetailBar.Constants.fontSize)
        deleteButton.addTarget(
            self,
            action:#selector(selectorDelete(sender:)),
            for:UIControlEvents.touchUpInside)
        
        addSubview(border)
        addSubview(labelTitle)
        addSubview(backButton)
        addSubview(deleteButton)
        
        NSLayoutConstraint.bottomToBottom(
            view:border,
            toView:self)
        NSLayoutConstraint.height(
            view:border,
            constant:ViewMain.Constants.borderWidth)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:labelTitle,
            toView:self,
            constant:ViewMain.Constants.contentTop)
        NSLayoutConstraint.bottomToBottom(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:labelTitle,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:backButton,
            toView:self,
            constant:ViewMain.Constants.contentTop)
        NSLayoutConstraint.bottomToBottom(
            view:backButton,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:backButton,
            toView:self)
        NSLayoutConstraint.width(
            view:backButton,
            constant:VPlansDetailBar.Constants.backWidth)
        
        NSLayoutConstraint.topToTop(
            view:deleteButton,
            toView:self,
            constant:ViewMain.Constants.contentTop)
        NSLayoutConstraint.bottomToBottom(
            view:deleteButton,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:deleteButton,
            toView:self)
        NSLayoutConstraint.width(
            view:deleteButton,
            constant:VPlansDetailBar.Constants.backWidth)
    }
}
