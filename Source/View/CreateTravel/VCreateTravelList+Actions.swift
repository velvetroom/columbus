import UIKit

extension VCreateTravelList
{
    //MARK: private
    
    private func asyncSelectCurrent()
    {
        guard
            
            let index:Int = controller.model.selectedIndex
            
        else
        {
            return
        }
        
        let indexPath:IndexPath = IndexPath(
            item:index,
            section:0)
        
        collectionView.selectItem(
            at:indexPath,
            animated:false,
            scrollPosition:UICollectionViewScrollPosition())
        
        updateSelector()
    }
    
    //MARK: internal
    
    func modelAtIndex(index:IndexPath) -> MCreateTravelProtocol
    {
        let item:MCreateTravelProtocol = controller.model.items[
            index.item]
        
        return item
    }
    
    func selectCurrent()
    {
        DispatchQueue.main.asyncAfter(
            deadline:DispatchTime.now() + kWaitToSelect)
        { [weak self] in
            
            self?.asyncSelectCurrent()
        }
    }
    
    func updateSelector()
    {
        guard
            
            let selected:IndexPath = collectionView.indexPathsForSelectedItems?.first,
            let cell:UICollectionViewCell = collectionView.cellForItem(
                at:selected)
            
        else
        {
            return
        }
        
        let cellX:CGFloat = cell.center.x
        let cellY:CGFloat = cell.center.y
        layoutSelectorLeft.constant = cellX - selectorSize_2
        layoutSelectorTop.constant = cellY - selectorSize_2
        
        UIView.animate(withDuration:kAnimationDuration)
        { [weak self] in
            
            self?.layoutIfNeeded()
        }
    }
    
    func waitAndClose()
    {
        DispatchQueue.main.asyncAfter(
            deadline:DispatchTime.now() + kWaitToUpdate)
        { [weak self] in
            
            self?.controller.back()
        }
    }
}
