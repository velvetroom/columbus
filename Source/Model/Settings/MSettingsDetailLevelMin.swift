import Foundation

struct MSettingsDetailLevelMin:MSettingsDetailLevelProtocol
{
    let detailLevel:DSettingsDetailLevel = DSettingsDetailLevel.min
    let title:String = String.localizedModel(
        key:"MSettingsDetailLevelMin_title")
    let descr:String = String.localizedModel(
        key:"MSettingsDetailLevelMin_descr")
}
