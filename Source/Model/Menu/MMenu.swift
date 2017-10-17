import Foundation

final class MMenu
{
    var selected:MMenu.Order
    let items:[MMenuItemProtocol]
    private let kInitialSelected:MMenu.Order = MMenu.Order.home
    
    init()
    {
        selected = kInitialSelected
        items = MMenu.factoryItems()
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
