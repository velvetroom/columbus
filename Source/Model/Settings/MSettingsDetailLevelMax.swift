import Foundation

struct MSettingsDetailLevelMax:MSettingsDetailLevelProtocol
{
    let detailLevel:DSettingsDetailLevel = DSettingsDetailLevel.max
    let title:String = String.localizedModel(
        key:"MSettingsDetailLevelMax_title")
    let descr:String = String.localizedModel(
        key:"MSettingsDetailLevelMax_descr")
}
