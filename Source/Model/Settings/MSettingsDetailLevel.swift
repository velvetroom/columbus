import UIKit

final class MSettingsDetailLevel:MSettingsProtocol
{
    let reusableIdentifier:String = VSettingsListCellDetailLevel.reusableIdentifier
    let cellHeight:CGFloat = 300
    let items:[MSettingsDetailLevelProtocol]
    let indexMap:[DSettingsDetailLevel:Int]
    private(set) weak var settings:DSettings!
    private(set) weak var database:Database!
    
    var selectedIndex:Int?
    {
        get
        {
            let index:Int? = indexMap[settings.detailLevel]
            
            return index
        }
    }
    
    init(
        settings:DSettings,
        database:Database)
    {
        self.settings = settings
        self.database = database
        
        items = MSettingsDetailLevel.factoryItems()
        indexMap = MSettingsDetailLevel.factoryIndexMap(
            items:items)
    }
    
    //MARK: internal
    
    func selected(index:Int)
    {
        settings.detailLevel = items[index].detailLevel
        database.save { }
    }
}
