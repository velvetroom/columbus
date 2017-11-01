import Foundation

struct MSettingsDistanceMiles:MSettingsDistanceProtocol
{
    let distance:DSettingsDistance = DSettingsDistance.miles
    let title:String = String.localizedModel(
        key:"MSettingsDistanceMiles_title")
}
