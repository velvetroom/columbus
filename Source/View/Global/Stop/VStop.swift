import UIKit

struct VStop
{
    //MARK: private
    
    private static func travelMap() -> [DPlanTravelMode:UIImage]
    {
        let map:[DPlanTravelMode:UIImage] = [
            DPlanTravelMode.walking : #imageLiteral(resourceName: "assetGenericStopWalking"),
            DPlanTravelMode.cycling : #imageLiteral(resourceName: "assetGenericStopCycling"),
            DPlanTravelMode.transit : #imageLiteral(resourceName: "assetGenericStopTransit"),
            DPlanTravelMode.driving : #imageLiteral(resourceName: "assetGenericStopDriving")]
        
        return map
    }
    
    private static func factoryIcon(travel:DPlanTravel) -> UIImage?
    {
        let map:[DPlanTravelMode:UIImage] = travelMap()
        let image:UIImage? = map[travel.mode]
        
        return image
    }
    
    //MARK: internal
    
    static func factoryIcon(stop:DPlanStop) -> UIImage?
    {
        let icon:UIImage?
        
        if let travel:DPlanTravel = stop.destinationTravel
        {
            icon = factoryIcon(travel:travel)
        }
        else
        {
            icon = #imageLiteral(resourceName: "assetGenericStopOrigin")
        }
        
        return icon
    }
}
