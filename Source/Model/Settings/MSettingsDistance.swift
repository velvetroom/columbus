import UIKit

final class MSettingsDistance:MSettingsProtocol
{
    let reusableIdentifier:String = VSettingsListCellDistance.reusableIdentifier
    let cellHeight:CGFloat = 190
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
