import UIKit

struct MSettingsTravelModeWalking:MSettingsTravelModeProtocol
{
    let mode:DPlanTravelMode = DPlanTravelMode.walking
    let icon:UIImage = #imageLiteral(resourceName: "assetGenericWalking")
    let title:String = String.localizedModel(
        key:"MSettingsTravelModeWalking_title")
}
