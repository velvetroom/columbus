import MapKit

final class VCreateSearchBaseListCell:UICollectionViewCell
{
    weak var label:UILabel!
    weak var layoutLabelHeight:NSLayoutConstraint!
    let attributesTitle:[NSAttributedStringKey:Any]
    let attributesTitleHighlighted:[NSAttributedStringKey:Any]
    let attributesSubtitle:[NSAttributedStringKey:Any]
    let attributesSubtitleHighlighted:[NSAttributedStringKey:Any]
    let breakLine:NSAttributedString
    private let kBreakLine:String = "\ntd;tr\n"
    private let kTitleFontSize:CGFloat = 14
    private let kSubtitleFontSize:CGFloat = 12
    private let kMarginHorizontal:CGFloat = 20
    private let kTitleTop:CGFloat = 10
    
    override init(frame:CGRect)
    {
        let colourLabel:UIColor = UIColor(white:0, alpha:0.6)
        let colourLabelHighlighted:UIColor = UIColor.colourBackgroundDark
        
        attributesTitle = [
            NSAttributedStringKey.font:
                UIFont.regular(size:kTitleFontSize),
            NSAttributedStringKey.foregroundColor:
                colourLabel]
        
        attributesTitleHighlighted = [
            NSAttributedStringKey.font:
                UIFont.regular(size:kTitleFontSize),
            NSAttributedStringKey.foregroundColor:
                colourLabelHighlighted]
        
        attributesSubtitle = [
            NSAttributedStringKey.font:
                UIFont.regular(size:kSubtitleFontSize),
            NSAttributedStringKey.foregroundColor:
                colourLabel]
        
        attributesSubtitleHighlighted = [
            NSAttributedStringKey.font:
                UIFont.regular(size:kSubtitleFontSize),
            NSAttributedStringKey.foregroundColor:
                colourLabelHighlighted]
        
        breakLine = NSAttributedString(string:kBreakLine)
        
        super.init(frame:frame)
        clipsToBounds = true
        isUserInteractionEnabled = false
        backgroundColor = UIColor.clear
        
        let label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.isUserInteractionEnabled = false
        label.numberOfLines = 0
        self.label = label
        
        addSubview(label)
        
        NSLayoutConstraint.topToTop(
            view:label,
            toView:self)
        layoutLabelHeight = NSLayoutConstraint.height(
            view:label)
        NSLayoutConstraint.equalsHorizontal(
            view:label,
            toView:self,
            margin:kMarginHorizontal)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    func config(model:MKLocalSearchCompletion)
    {
        let text:NSAttributedString = factoryText(model:model)
        label.attributedText = text
    }
}
