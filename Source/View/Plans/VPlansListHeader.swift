import UIKit

final class VPlansListHeader:UICollectionReusableView
{
    private let kTextTop:CGFloat = 80
    private let kTextMarginHorizontal:CGFloat = 20
    private let kTextHeight:CGFloat = 50
    private let kFontSize:CGFloat = 14
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        backgroundColor = UIColor.clear
        isUserInteractionEnabled = false
        clipsToBounds = true
        
        let labelText:UILabel = UILabel()
        labelText.isUserInteractionEnabled = false
        labelText.translatesAutoresizingMaskIntoConstraints = false
        labelText.backgroundColor = UIColor.clear
        labelText.numberOfLines = 0
        labelText.font = UIFont.regular(size:kFontSize)
        labelText.textColor = UIColor(white:0, alpha:0.5)
        labelText.text = String.localizedView(
            key:"VPlansListHeader_labelText")
        
        addSubview(labelText)
        
        NSLayoutConstraint.topToTop(
            view:labelText,
            toView:self,
            constant:kTextTop)
        NSLayoutConstraint.height(
            view:labelText,
            constant:kTextHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:labelText,
            toView:self,
            margin:kTextMarginHorizontal)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
