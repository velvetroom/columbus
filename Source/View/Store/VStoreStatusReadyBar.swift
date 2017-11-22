import UIKit

final class VStoreStatusReadyBar:View<ArchStore>
{
    required init(controller:CStore)
    {
        super.init(controller:controller)
        backgroundColor = UIColor.white
        
        let border:VBorder = VBorder(colour:UIColor(white:0, alpha:0.2))
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.font = UIFont.medium(size:VStoreStatusReadyBar.Constants.fontSize)
        labelTitle.textColor = UIColor.colourBackgroundDark
        labelTitle.textAlignment = NSTextAlignment.center
        labelTitle.text = String.localizedView(key:"VStoreStatusReadyBar_labelTitle")
        
        let viewRestore:VStoreStatusReadyBarRestore = VStoreStatusReadyBarRestore(controller:controller)
        
        addSubview(border)
        addSubview(labelTitle)
        addSubview(viewRestore)
        
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
            view:viewRestore,
            toView:self,
            constant:ViewMain.Constants.contentTop)
        NSLayoutConstraint.bottomToBottom(
            view:viewRestore,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:viewRestore,
            toView:self)
        NSLayoutConstraint.width(
            view:viewRestore,
            constant:VStoreStatusReadyBar.Constants.restoreWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
