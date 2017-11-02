import UIKit

final class VSettingsListCellDetailLevelListCell:
    UICollectionViewCell
{
    private weak var labelTitle:UILabel!
    private let kTitleFontSize:CGFloat = 13
    
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
        
        addSubview(labelTitle)
        
        NSLayoutConstraint.equals(
            view:labelTitle,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
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
        }
        else
        {
            labelTitle.textColor = UIColor(white:0, alpha:0.3)
        }
    }
    
    //MARK: internal
    
    func config(model:MSettingsDetailLevelProtocol)
    {
        labelTitle.text = model.title
        
        hover()
    }
}