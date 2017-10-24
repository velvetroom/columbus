import UIKit

struct MSettingsTravelModeDriving:MSettingsTravelModeProtocol
{
    let mode:DPlanTravelMode = DPlanTravelMode.driving
    let icon:UIImage = #imageLiteral(resourceName: "assetGenericDriving")
}
