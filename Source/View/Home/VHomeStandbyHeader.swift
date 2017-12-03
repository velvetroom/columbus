import UIKit

final class VHomeStandbyHeader:View<ArchHome>
{
    private weak var layoutHeaderTop:NSLayoutConstraint!
    
    required init(controller:CHome)
    {
        super.init(controller:controller)
        isUserInteractionEnabled = false
        clipsToBounds = true
        backgroundColor = UIColor.white
        
        let icon:UIImageView = UIImageView()
        icon.isUserInteractionEnabled = false
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.clipsToBounds = true
        icon.contentMode = UIViewContentMode.center
        icon.image = #imageLiteral(resourceName: "assetGenericLogo")
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.textAlignment = NSTextAlignment.center
        labelTitle.font = UIFont.bold(size:VHomeStandbyHeader.Constants.fontSize)
        labelTitle.textColor = UIColor.colourSuccess
        labelTitle.text = String.localizedView(key:"VHomeStandbyHeader_labelTitle")
        
        let border:VBorder = VBorder(colour:UIColor.colourBackgroundGray)
        
        addSubview(icon)
        addSubview(labelTitle)
        addSubview(border)
        
        layoutHeaderTop = NSLayoutConstraint.topToTop(
            view:icon,
            toView:self)
        NSLayoutConstraint.height(
            view:icon,
            constant:VHomeStandbyHeader.Constants.iconHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:icon,
            toView:self)
        
        NSLayoutConstraint.topToBottom(
            view:labelTitle,
            toView:icon,
            constant:VHomeStandbyHeader.Constants.titleTop)
        NSLayoutConstraint.height(
            view:labelTitle,
            constant:VHomeStandbyHeader.Constants.titleHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:labelTitle,
            toView:self)
        
        NSLayoutConstraint.bottomToBottom(
            view:border,
            toView:self)
        NSLayoutConstraint.height(
            view:border,
            constant:ViewMain.Constants.borderWidth)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        let height:CGFloat = bounds.height
        let iconTop:CGFloat = height * VHomeStandbyHeader.Constants.iconTopRatio
        layoutHeaderTop.constant = iconTop
        
        super.layoutSubviews()
    }
}
