import Foundation

extension VHomeReadyBarList
{
    //MARK: internal
    
    func modelAtIndex(index:IndexPath) -> DPlanStop
    {
        let item:DPlanStop = model![index.item]
        
        return item
    }
    
    func selectInMap(item:DPlanStop)
    {
        guard
        
            let view:VHomeReady = controller.model.view?.view as? VHomeReady
        
        else
        {
            return
        }
        
        view.viewMap.centreAndSelect(stop:item)
    }
}
