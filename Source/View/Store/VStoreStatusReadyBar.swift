import UIKit

final class VStoreStatusReadyBar:View<ArchStore>
{
    private let kContentTop:CGFloat = 20
    private let kTitleLeft:CGFloat = 20
    private let kTitleWidth:CGFloat = 150
    private let kBorderHeight:CGFloat = 1
    private let kFontSize:CGFloat = 14
    
    required init(controller:CStore)
    {
        super.init(controller:controller)
        backgroundColor = UIColor.white
        
        let border:VBorder = VBorder(
            colour:UIColor(white:0, alpha:0.2))
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.font = UIFont.medium(size:kFontSize)
        labelTitle.textColor = UIColor.colourBackgroundDark
        labelTitle.text = String.localizedView(
            key:"VStoreStatusReadyBar_labelTitle")
        
        addSubview(border)
        addSubview(labelTitle)
        
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
            constant:kContentTop)
        NSLayoutConstraint.bottomToBottom(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:labelTitle,
            toView:self,
            constant:kTitleLeft)
        NSLayoutConstraint.width(
            view:labelTitle,
            constant:kTitleWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
