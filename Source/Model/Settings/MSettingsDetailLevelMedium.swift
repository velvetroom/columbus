import Foundation

struct MSettingsDetailLevelMedium:MSettingsDetailLevelProtocol
{
    let detailLevel:DSettingsDetailLevel = DSettingsDetailLevel.medium
    let title:String = String.localizedModel(key:"MSettingsDetailLevelMedium_title")
    let descr:String = String.localizedModel(key:"MSettingsDetailLevelMedium_descr")
}
