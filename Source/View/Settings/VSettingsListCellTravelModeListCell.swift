import UIKit

final class VSettingsListCellTravelModeListCell:
    UICollectionViewCell
{
    private weak var imageView:UIImageView!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        
        let imageView:UIImageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = UIViewContentMode.center
        imageView.clipsToBounds = true
        self.imageView = imageView
        
        addSubview(imageView)
        
        NSLayoutConstraint.equals(
            view:imageView,
            toView:imageView)
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
            imageView.tintColor = UIColor.white
        }
        else
        {
            imageView.tintColor = UIColor(white:0, alpha:0.3)
        }
    }
    
    //MARK: internal
    
    func config(model:MSettingsTravelModeProtocol)
    {
        imageView.image = model.icon.withRenderingMode(
            UIImageRenderingMode.alwaysTemplate)
        hover()
    }
}
