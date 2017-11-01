import UIKit

final class MSettingsDistance:MSettingsProtocol
{
    let reusableIdentifier:String = VSettingsListCellDistance.reusableIdentifier
    let cellHeight:CGFloat = 160
    let items:[MSettingsDistanceProtocol]
    let indexMap:[DSettingsDistance:Int]
    private(set) weak var settings:DSettings!
    private(set) weak var database:Database!
    
    init(
        settings:DSettings,
        database:Database)
    {
        self.settings = settings
        self.database = database
        
        items = MSettingsDistance.factoryItems()
        indexMap = MSettingsDistance.factoryIndexMap(
            items:items)
    }
    
    //MARK: internal
    
    func selected(index:Int)
    {
        settings.distance = items[index].distance
        database.save { }
    }
    
    func selectedIndex() -> Int?
    {
        let index:Int? = indexMap[settings.distance]
        
        return index
    }
    
    func itemsTitle() -> [String]
    {
        var titles:[String] = []
        
        for item:MSettingsDistanceProtocol in items
        {
            titles.append(
                item.title)
        }
        
        return titles
    }
}
