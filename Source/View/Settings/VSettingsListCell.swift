import UIKit

class VSettingsListCell:UICollectionViewCell
{
    private(set) weak var controller:CSettings?
    private let kBorderHeight:CGFloat = 1
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.white
        
        let borderTop:VBorder = VBorder(
            colour:UIColor(white:0, alpha:0.2))
        let borderBottom:VBorder = VBorder(
            colour:UIColor(white:0, alpha:0.2))
        
        addSubview(borderTop)
        addSubview(borderBottom)
        
        NSLayoutConstraint.topToTop(
            view:borderTop,
            toView:self)
        NSLayoutConstraint.height(
            view:borderTop,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:borderTop,
            toView:self)
        
        NSLayoutConstraint.bottomToBottom(
            view:borderBottom,
            toView:self)
        NSLayoutConstraint.height(
            view:borderBottom,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:borderBottom,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: internal
    
    func config(
        controller:CSettings,
        model:MSettingsProtocol)
    {
        self.controller = controller
    }
}
