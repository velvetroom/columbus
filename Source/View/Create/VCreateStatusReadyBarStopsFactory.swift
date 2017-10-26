import UIKit

extension VCreateStatusReadyBarStops
{
    //MARK: internal
    
    func factoryIndexPath(stop:DPlanStop) -> IndexPath?
    {
        guard
        
            let index:Int = factoryIndex(stop:stop)
        
        else
        {
            return nil
        }
        
        let indexPath:IndexPath? = factoryIndexPath(
            index:index)
        
        return indexPath
    }
    
    func factoryIndex(stop:DPlanStop) -> Int?
    {
        guard
            
            let model:[DPlanStop] = self.model
            
        else
        {
            return nil
        }
        
        var index:Int = 0
        
        for indexedStop:DPlanStop in model
        {
            guard
                
                indexedStop === stop
                
            else
            {
                index += 1
                
                continue
            }
            
            return index
        }
        
        return nil
    }
    
    func factoryIndexPath(index:Int) -> IndexPath?
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
}
