import UIKit

struct MCreateTravelTransit:MCreateTravelProtocol
{
    let mode:DPlanTravelMode = DPlanTravelMode.transit
    let icon:UIImage = #imageLiteral(resourceName: "assetGenericTransit")
}
