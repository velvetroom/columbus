import UIKit

extension VCreateStatusReadyBarTravelCell
{
    struct Constants
    {
        static let imageMap:[DPlanTravelMode:UIImage] = [
                DPlanTravelMode.walking : #imageLiteral(resourceName: "assetMapWalking"),
                DPlanTravelMode.cycling : #imageLiteral(resourceName: "assetMapCycling"),
                DPlanTravelMode.transit : #imageLiteral(resourceName: "assetMapTransit"),
                DPlanTravelMode.driving : #imageLiteral(resourceName: "assetMapDriving")]
    }
}
