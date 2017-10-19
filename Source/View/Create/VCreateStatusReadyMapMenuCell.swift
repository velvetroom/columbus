import UIKit

final class VCreateStatusReadyMapMenuCell:
    UICollectionViewCell
{
    private weak var icon:UIImageView!
    private let kAlphaSelected:CGFloat = 0.4
    private let kAlphaNotSelected:CGFloat = 1
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        
        let icon:UIImageView = UIImageView()
        icon.isUserInteractionEnabled = false
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.contentMode = UIViewContentMode.center
        icon.clipsToBounds = true
        self.icon = icon
        
        addSubview(icon)
        
        NSLayoutConstraint.equals(
            view:icon,
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
            icon.alpha = kAlphaSelected
        }
        else
        {
            icon.alpha = kAlphaNotSelected
        }
    }
    
    //MARK: internal
    
    func config(model:MCreateMapMenuProtocol)
    {
        icon.image = model.icon
        hover()
    }
}
