import UIKit

final class VSettingsListCellDetailLevelListCell:
    UICollectionViewCell
{
    private weak var labelTitle:UILabel!
    private weak var viewBackground:UIView!
    private weak var layoutBackgroundTop:NSLayoutConstraint!
    private weak var layoutBackgroundLeft:NSLayoutConstraint!
    private let kTitleFontSize:CGFloat = 13
    private let kBackgroundWidth:CGFloat = 6
    private let kBackgroundHeight:CGFloat = 20
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.font = UIFont.medium(size:kTitleFontSize)
        labelTitle.textColor = UIColor.colourBackgroundDark
        labelTitle.textAlignment = NSTextAlignment.center
        self.labelTitle = labelTitle
        
        let viewBackground:UIView = UIView()
        viewBackground.isUserInteractionEnabled = false
        viewBackground.translatesAutoresizingMaskIntoConstraints = false
        viewBackground.backgroundColor = UIColor.white
        viewBackground.clipsToBounds = true
        self.viewBackground = viewBackground
        
        addSubview(viewBackground)
        addSubview(labelTitle)
        
        layoutBackgroundTop = NSLayoutConstraint.topToTop(
            view:viewBackground,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBackground,
            constant:kBackgroundHeight)
        layoutBackgroundLeft = NSLayoutConstraint.leftToLeft(
            view:viewBackground,
            toView:self)
        NSLayoutConstraint.width(
            view:viewBackground,
            constant:kBackgroundWidth)
        
        NSLayoutConstraint.equals(
            view:labelTitle,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = bounds.width
        let height:CGFloat = bounds.height
        let remainWidthBackground:CGFloat = width - kBackgroundWidth
        let remainHeightBackground:CGFloat = height - kBackgroundHeight
        let backgroundLeft:CGFloat = remainWidthBackground / 2.0
        let backgroundTop:CGFloat = remainHeightBackground / 2.0
        
        layoutBackgroundLeft.constant = backgroundLeft
        layoutBackgroundTop.constant = backgroundTop
        
        super.layoutSubviews()
    }
    
    override var isSelected:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    override var isHighlighted:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    //MARK: private
    
    private func hover()
    {
        if isSelected || isHighlighted
        {
            labelTitle.textColor = UIColor.white
            viewBackground.isHidden = true
        }
        else
        {
            labelTitle.textColor = UIColor(white:0, alpha:0.3)
            viewBackground.isHidden = false
        }
    }
    
    //MARK: internal
    
    func config(model:MSettingsDetailLevelProtocol)
    {
        labelTitle.text = model.title
        
        hover()
    }
}
