import UIKit

extension VCreateStatusReadyBarTravel
{
    //MARK: private
    
    private func factoryIndexPath(travel:DPlanTravel) -> IndexPath?
    {
        guard
            
            let index:Int = factoryIndex(travel:travel)
            
        else
        {
            return nil
        }
        
        let indexPath:IndexPath? = factoryIndexPath(
            index:index)
        
        return indexPath
    }
    
    private func factoryIndex(travel:DPlanTravel) -> Int?
    {
        guard
            
            let model:[DPlanTravel] = self.model
            
        else
        {
            return nil
        }
        
        var index:Int = 0
        
        for indexedTravel:DPlanTravel in model
        {
            guard
                
                indexedTravel === travel
                
            else
            {
                index += 1
                
                continue
            }
            
            return index
        }
        
        return nil
    }
    
    private func factoryIndexPath(index:Int) -> IndexPath?
    {
        let currentItems:Int = collectionView.numberOfItems(
            inSection:0)
        
        guard
            
            index <  currentItems
            
        else
        {
            return nil
        }
        
        let indexPath:IndexPath = IndexPath(
            item:index,
            section:0)
        
        return indexPath
    }
    
    //MARK: internal
    
    func modelAtIndex(
        index:IndexPath) -> DPlanTravel
    {
        let item:DPlanTravel = model![index.item]
        
        return item
    }
    
    func updateTravel(travel:DPlanTravel)
    {
        guard
            
            let indexPath:IndexPath = factoryIndexPath(
                travel:travel),
            let cell:VCreateStatusReadyBarTravelCell = collectionView.cellForItem(
                at:indexPath) as? VCreateStatusReadyBarTravelCell
            
        else
        {
            return
        }
        
        cell.config(
            controller:controller,
            model:travel)
    }
}
