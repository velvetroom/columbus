import UIKit

final class VHomeReadyMapMenuCell:UICollectionViewCell
{
    private weak var icon:UIImageView!
    private weak var image:UIImage?
    private weak var imageSelected:UIImage?
    
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
            icon.image = imageSelected
        }
        else
        {
            icon.image = image
        }
    }
    
    //MARK: internal
    
    func config(model:MHomeMapMenuProtocol)
    {
        image = model.icon
        imageSelected = model.iconSelected
        hover()
    }
}
