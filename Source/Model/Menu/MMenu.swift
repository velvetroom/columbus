import Foundation

final class MMenu
{
    var selected:MMenuOrder
    let items:[MMenuItemProtocol]
    private let kInitialSelected:MMenuOrder = MMenuOrder.home
    
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
