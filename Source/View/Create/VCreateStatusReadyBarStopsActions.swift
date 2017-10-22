import UIKit

extension VCreateStatusReadyBarStops
{
    //MARK: internal
    
    func selectItem(index:Int)
    {
        let indexPath:IndexPath = IndexPath(
            item:index,
            section:0)
        collectionView.selectItem(
            at:indexPath,
            animated:true,
            scrollPosition:UICollectionViewScrollPosition.centeredVertically)
    }
    
    func deselectAll()
    {
        collectionView.selectItem(
            at:nil,
            animated:true,
            scrollPosition:UICollectionViewScrollPosition())
    }
    
    func selectedCell(indexPath:IndexPath)
    {
        guard
            
            let view:VCreateStatusReady = controller.model.view?.view as? VCreateStatusReady
        
        else
        {
            return
        }
        
        let stop:DPlanStop = modelAtIndex(
            index:indexPath)
        view.viewMap.centreAndSelect(
            stop:stop)
    }
    
    func modelAtIndex(
        index:IndexPath) -> DPlanStop
    {
        let item:DPlanStop = controller.model.plan!.plan.stops![
            index.item] as! DPlanStop
        
        return item
    }
}
