import Foundation

final class MMenu
{
    var selected:MMenu.Order
    let items:[MMenuItemProtocol]
    private let itemsMap:[MMenu.Order:MMenuItemProtocol]
    private let kInitialSelected:MMenu.Order = MMenu.Order.home
    
    init()
    {
        selected = kInitialSelected
        items = MMenu.factoryItems()
        itemsMap = MMenu.factoryItemsMap(items:items)
    }
    
    //MARK: internal
    
    func selectedItem() -> MMenuItemProtocol?
    {
        for item:MMenuItemProtocol in items
        {
            if item.order == selected
            {
                return item
            }
        }
        
        return nil
    }
}
