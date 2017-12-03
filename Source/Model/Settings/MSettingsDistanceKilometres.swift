import Foundation

struct MSettingsDistanceKilometres:MSettingsDistanceProtocol
{
    let distance:DSettingsDistance = DSettingsDistance.kilometres
    let title:String = String.localizedModel(key:"MSettingsDistanceKilometres_title")
}
