import UIKit

extension VCreateStatusReadyBarStops
{
    //MARK: private
    
    private func isSelected(
        indexPath:IndexPath) -> Bool
    {
        guard
        
            let selected:[
            IndexPath] = collectionView.indexPathsForSelectedItems
        
        else
        {
            return false
        }
        
        for itemSelected:IndexPath in selected
        {
            guard
                
                itemSelected == indexPath
                
            else
            {
                continue
            }
            
            return true
        }
        
        return false
    }
    
    private func selectItem(indexPath:IndexPath)
    {
        guard
            
            !isSelected(indexPath:indexPath)
        
        else
        {
            return
        }
        
        collectionView.selectItem(
            at:indexPath,
            animated:true,
            scrollPosition:UICollectionViewScrollPosition.centeredVertically)
    }
    
    //MARK: internal
    
    func selectItem(index:Int)
    {
        let currentItems:Int = collectionView.numberOfItems(
            inSection:0)
        
        guard
            
            index <  currentItems
        
        else
        {
            return
        }
        
        let indexPath:IndexPath = IndexPath(
            item:index,
            section:0)
        selectItem(indexPath:indexPath)
    }
    
    func selectItem(stop:DPlanStop)
    {
        guard
        
            let stops:[DPlanStop] = stopList()
        
        else
        {
            return
        }
        
        var index:Int = 0
        
        for indexedStop:DPlanStop in stops
        {
            guard
            
                indexedStop === stop
            
            else
            {
                index += 1
                
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
}
