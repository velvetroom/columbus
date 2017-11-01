import Foundation

struct MSettingsDistanceKilometers:MSettingsDistanceProtocol
{
    let distance:DSettingsDistance = DSettingsDistance.kilometers
    let title:String = String.localizedModel(
        key:"MSettingsDistanceKilometers_title")
}
