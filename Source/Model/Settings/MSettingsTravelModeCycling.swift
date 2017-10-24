import UIKit

struct MSettingsTravelModeCycling:MSettingsTravelModeProtocol
{
    let mode:DPlanTravelMode = DPlanTravelMode.cycling
    let icon:UIImage = #imageLiteral(resourceName: "assetGenericCycling")
    let title:String = String.localizedModel(
        key:"MSettingsTravelModeCycling_title")
}
