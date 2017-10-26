import UIKit

extension VCreateStatusReadyBarTravelCell
{
    private static let kImageMap:[
        DPlanTravelMode:UIImage] = [
            DPlanTravelMode.walking:#imageLiteral(resourceName: "assetMapWalking"),
            DPlanTravelMode.cycling:#imageLiteral(resourceName: "assetMapCycling"),
            DPlanTravelMode.transit:#imageLiteral(resourceName: "assetMapTransit"),
            DPlanTravelMode.driving:#imageLiteral(resourceName: "assetMapDriving")]
    
    //MARK: internal
    
    class func factoryImage(
        mode:DPlanTravelMode) -> UIImage?
    {
        guard
        
            let image:UIImage = kImageMap[mode]
        
        else
        {
            return nil
        }
        
        return image.withRenderingMode(
            UIImageRenderingMode.alwaysTemplate)
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
