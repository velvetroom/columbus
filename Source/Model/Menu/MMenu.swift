import Foundation

final class MMenu
{
    var selected:MMenu.Order
    let items:[MMenuItemProtocol]
    private let itemsMap:[MMenu.Order:MMenuItemProtocol]
    private let kInitialSelected:MMenu.Order = MMenu.Order.home
    
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
        selected = kInitialSelected
        items = MMenu.factoryItems()
        itemsMap = MMenu.factoryItemsMap(items:items)
    }
}
