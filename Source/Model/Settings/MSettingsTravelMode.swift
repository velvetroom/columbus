import UIKit

final class MSettingsTravelMode:MSettingsProtocol
{
    let reusableIdentifier:String = VSettingsListCellTravelMode.reusableIdentifier
    let cellHeight:CGFloat = 160
    let items:[MSettingsTravelModeProtocol]
    let indexMap:[DPlanTravelMode:Int]
    private(set) weak var settings:DSettings!
    private(set) weak var database:Database!
    
    init(
        settings:DSettings,
        database:Database)
    {
        self.settings = settings
        self.database = database
        
        items = MSettingsTravelMode.factoryItems()
        indexMap = MSettingsTravelMode.factoryIndexMap(
            items:items)
    }
}
