import UIKit

extension VHomeReadyBarList
{
    //MARK: private
    
    private func selectItem(index:Int)
    {
        let indexPath:IndexPath = IndexPath(
            item:index,
            section:0)
        
        collectionView.selectItem(
            at:indexPath,
            animated:true,
            scrollPosition:UICollectionViewScrollPosition.centeredVertically)
    }
    
    //MARK: internal
    
    func modelAtIndex(index:IndexPath) -> MHomePlanItemProtocol
    {
        let item:MHomePlanItemProtocol = controller.model.plan!.items[index.item]
        
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
        view.displayDistance(item:item)
    }
    
    func selectItem(item:DPlanStop)
    {
        guard
        
            let model:[MHomePlanItemProtocol] = controller.model.plan?.items
        
        else
        {
            return
        }
        
        let countItems:Int = model.count
        
        for index:Int in 0 ..< countItems
        {
            let indexedItem:MHomePlanItemProtocol = model[index]
            
            guard
            
                let itemStop:MHomePlanItemStop = indexedItem as? MHomePlanItemStop,
                itemStop.stop === item
            
            else
            {
                continue
            }
         
            selectItem(index:index)
            
            break
        }
    }
    
    func deselectAll()
    {
        collectionView.selectItem(
            at:nil,
            animated:true,
            scrollPosition:UICollectionViewScrollPosition())
    }
}
