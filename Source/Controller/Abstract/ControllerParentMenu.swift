import UIKit

extension ControllerParent
{
    //MARK: private
    
    private func factoryDirection(
        item:MMenuItemProtocol) ->  ControllerParent.Horizontal
    {
        let order:MMenu.Order = item.order
        let current:MMenu.Order = menu.selected
        let direction:ControllerParent.Horizontal
        
        if order.rawValue > current.rawValue
        {
            direction = ControllerParent.Horizontal.right
        }
        else
        {
            direction = ControllerParent.Horizontal.left
        }
        
        return direction
    }
    
    //MARK: internal
    
    func selectedController() -> UIViewController?
    {
        guard
            
            let item:MMenuItemProtocol = menu.selectedItem()
        
        else
        {
            return nil
        }
        
        let controller:UIViewController = item.controllerType.init()
        
        return controller
    }
    
    func menuSelected(item:MMenuItemProtocol)
    {
        let direction:ControllerParent.Horizontal = factoryDirection(
            item:item)
        menu.selected = item.order
        
        guard
            
            let controller:UIViewController = selectedController()
        
        else
        {
            return
        }
        
        slideTo(
            horizontal:direction,
            controller:controller)
    }
}
