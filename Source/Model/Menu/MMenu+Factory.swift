import Foundation

extension MMenu
{
    //MARK: private
    
    private class func factoryItemsList() -> [MMenuItemProtocol]
    {
        let itemHome:MMenuItemHome = MMenuItemHome()
        let itemCreate:MMenuItemCreate = MMenuItemCreate()
        let itemPlans:MMenuItemPlans = MMenuItemPlans()
        let itemSettings:MMenuItemSettings = MMenuItemSettings()
        let itemStore:MMenuItemStore = MMenuItemStore()
        
        let map:[MMenuItemProtocol] = [
            itemHome,
            itemCreate,
            itemPlans,
            itemSettings,
            itemStore]
        
        return map
    }
    
    //MARK: internal
    
    class func factoryItems() -> [MMenuItemProtocol]
    {
        var items:[MMenuItemProtocol] = factoryItemsList()
        
        items.sort
        { (itemA:MMenuItemProtocol, itemB:MMenuItemProtocol) -> Bool in
            
            return itemA.order.rawValue < itemB.order.rawValue
        }
        
        return items
    }
    
    class func factoryItemsMap(items:[MMenuItemProtocol]) -> [MMenu.Order:MMenuItemProtocol]
    {
        var map:[MMenu.Order:MMenuItemProtocol] = [:]
        
        for item:MMenuItemProtocol in items
        {
            
        }
        
        return map
    }
}
