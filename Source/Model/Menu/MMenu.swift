import Foundation

final class MMenu
{
    var selected:MMenu.Order
    let items:[MMenuItemProtocol]
    private let itemsMap:[MMenu.Order:MMenuItemProtocol]
    
    var selectedItem:MMenuItemProtocol?
    {
        get
        {
            let selected:MMenuItemProtocol? = itemsMap[self.selected]
            
            return selected
        }
    }
    
    init()
    {
        selected = MMenu.Constants.initialSelected
        items = MMenu.factoryItems()
        itemsMap = MMenu.factoryItemsMap(items:items)
    }
}
