import Foundation

extension VHomeReadyMap
{
    //MARK: internal
    
    func selectInList(item:DPlanStop)
    {
        guard
        
            let view:VHomeReady = controller.model.view?.view as? VHomeReady
        
        else
        {
            return
        }
        
        view.viewBar.viewList.selectItem(item:item)
        view.displayDistance(item:item)
    }
    
    func deselectInList()
    {
        guard
            
            let view:VHomeReady = controller.model.view?.view as? VHomeReady
            
        else
        {
            return
        }
        
        view.viewBar.viewList.deselectAll()
    }
}
