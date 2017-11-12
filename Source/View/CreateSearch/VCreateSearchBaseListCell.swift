import MapKit

final class VCreateSearchBaseListCell:UICollectionViewCell
{
    private weak var labelTitle:UILabel!
    private let kTitleFontSize:CGFloat = 14
    private let kMarginHorizontal:CGFloat = 20
    private let kTitleHeight:CGFloat = 30
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        isUserInteractionEnabled = false
        backgroundColor = UIColor.clear
        
        let labelTitle:UILabel = UILabel()
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.isUserInteractionEnabled = false
        labelTitle.font = UIFont.regular(size:kTitleFontSize)
        labelTitle.textColor = UIColor.colourBackgroundDark
        self.labelTitle = labelTitle
        
        addSubview(labelTitle)
        
        NSLayoutConstraint.topToTop(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.height(
            view:labelTitle,
            constant:kTitleHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:labelTitle,
            toView:self,
            margin:kMarginHorizontal)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    func config(model:MKLocalSearchCompletion)
    {
        labelTitle.text = model.title
    }
}
