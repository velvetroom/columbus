import UIKit

extension VCreateStatusReadyBarTravelCell
{
    //MARK: private
    
    private class func imageMap() -> [DPlanTravelMode:UIImage]
    {
        let map:[DPlanTravelMode:UIImage] = [
            DPlanTravelMode.walking : #imageLiteral(resourceName: "assetMapWalking"),
            DPlanTravelMode.cycling : #imageLiteral(resourceName: "assetMapCycling"),
            DPlanTravelMode.transit : #imageLiteral(resourceName: "assetMapTransit"),
            DPlanTravelMode.driving : #imageLiteral(resourceName: "assetMapDriving")]
        
        return map
    }
    
    //MARK: internal
    
    class func factoryImage(mode:DPlanTravelMode) -> UIImage?
    {
        let map:[DPlanTravelMode:UIImage] = imageMap()
        
        guard
        
            let image:UIImage = map[mode]
        
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
