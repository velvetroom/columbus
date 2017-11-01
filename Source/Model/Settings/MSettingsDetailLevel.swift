import UIKit

final class MSettingsDetailLevel:MSettingsProtocol
{
    let reusableIdentifier:String = VSettingsListCellDetailLevel.reusableIdentifier
    let cellHeight:CGFloat = 300
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
    
    //MARK: internal
    
    func selected(index:Int)
    {
        settings.travelMode = items[index].mode
        database.save { }
    }
}
