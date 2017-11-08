import UIKit

final class VStoreStatusReadyListCellPurchasing:VStoreStatusReadyListCellAvailable
{
    private let kLabelFontSize:CGFloat = 15
    private let kLabelHeight:CGFloat = 80
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        isUserInteractionEnabled = false
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = NSTextAlignment.center
        label.backgroundColor = UIColor.clear
        label.font = UIFont.regular(size:kLabelFontSize)
        label.textColor = UIColor(white:0, alpha:0.4)
        label.text = String.localizedView(
            key:"VStoreStatusReadyListCellPurchasing_label")
        
        addSubview(label)
        
        NSLayoutConstraint.bottomToBottom(
            view:label,
            toView:self)
        NSLayoutConstraint.height(
            view:label,
            constant:kLabelHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:label,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
