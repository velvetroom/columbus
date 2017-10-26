import UIKit

extension VCreateStatusReadyBarTravelCell
{
    //MARK: internal
    
    class func factoryImage(
        mode:DPlanTravelMode) -> UIImage?
    {
        return #imageLiteral(resourceName: "assetMapDriving").withRenderingMode(UIImageRenderingMode.alwaysTemplate)
    }
    
    func factoryViews()
    {
        let imageView:UIImageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = UIViewContentMode.top
        imageView.clipsToBounds = true
        self.imageView = imageView
        
        addSubview(imageView)
        
        NSLayoutConstraint.equals(
            view:imageView,
            toView:self)
    }
}
