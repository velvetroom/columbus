import UIKit

extension VCreateStatusReadyBarTravelCell
{
    //MARK: internal
    
    class func factoryImage(mode:DPlanTravelMode) -> UIImage?
    {
        guard
        
            let image:UIImage = VCreateStatusReadyBarTravelCell.Constants.imageMap[mode]
        
        else
        {
            return nil
        }
        
        return image.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
    }
    
    func factoryViews()
    {
        let imageView:UIImageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = UIViewContentMode.center
        imageView.clipsToBounds = true
        self.imageView = imageView
        
        addSubview(imageView)
        
        NSLayoutConstraint.equals(
            view:imageView,
            toView:self)
    }
}
