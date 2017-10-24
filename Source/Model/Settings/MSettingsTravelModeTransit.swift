import UIKit

struct MSettingsTravelModeTransit:MSettingsTravelModeProtocol
{
    let mode:DPlanTravelMode = DPlanTravelMode.transit
    let icon:UIImage = #imageLiteral(resourceName: "assetGenericTransit")
}
