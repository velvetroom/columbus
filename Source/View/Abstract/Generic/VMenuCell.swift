import UIKit

final class VMenuCell:UICollectionViewCell
{
    private weak var imageView:UIImageView!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        
        let imageView:UIImageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        imageView.clipsToBounds = true
        imageView.contentMode = UIViewContentMode.center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView = imageView
        
        addSubview(imageView)
        
        NSLayoutConstraint.equals(
            view:imageView,
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
            imageView.tintColor = UIColor.colourBackgroundDark
        }
        else
        {
            imageView.tintColor = UIColor.colourBackgroundDark.withAlphaComponent(
                0.2)
        }
    }
    
    //MARK: internal
    
    func config(model:MMenuItemProtocol)
    {
        imageView.image = model.icon.withRenderingMode(
            UIImageRenderingMode.alwaysTemplate)
        hover()
    }
}
