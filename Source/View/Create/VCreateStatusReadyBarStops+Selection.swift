import UIKit

extension VCreateStatusReadyBarStops
{
    //MARK: private
    
    private func selectItem(indexPath:IndexPath)
    {
        collectionView.selectItem(
            at:indexPath,
            animated:true,
            scrollPosition:UICollectionViewScrollPosition.centeredVertically)
    }
    
    //MARK: internal
    
    func selectItem(index:Int)
    {
        guard
            
            let indexPath:IndexPath = factoryIndexPath(index:index)
        
        else
        {
            return
        }
        
        selectItem(indexPath:indexPath)
    }
    
    func selectItem(stop:DPlanStop)
    {
        guard
        
            let indexPath:IndexPath = factoryIndexPath(stop:stop)
        
        else
        {
            return
        }
        
        selectItem(indexPath:indexPath)
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
        
        let stop:DPlanStop = modelAtIndex(index:indexPath)
        view.viewMap.centreAndSelect(stop:stop)
    }
}
