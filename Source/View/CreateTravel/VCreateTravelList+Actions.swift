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
        let item:MCreateTravelProtocol = controller.model.items[index.item]
        
        return item
    }
    
    func selectCurrent()
    {
        let deadline:DispatchTime = DispatchTime.now() + VCreateTravelList.Constants.waitToSelect
        DispatchQueue.main.asyncAfter(deadline:deadline)
        { [weak self] in
            
            self?.asyncSelectCurrent()
        }
    }
    
    func updateSelector()
    {
        guard
            
            let selected:IndexPath = collectionView.indexPathsForSelectedItems?.first,
            let cell:UICollectionViewCell = collectionView.cellForItem(at:selected)
            
        else
        {
            return
        }
        
        let cellX:CGFloat = cell.center.x
        let cellY:CGFloat = cell.center.y
        layoutSelectorLeft.constant = cellX - selectorSize_2
        layoutSelectorTop.constant = cellY - selectorSize_2
        
        UIView.animate(withDuration:VCreateTravelList.Constants.animationDuration)
        { [weak self] in
            
            self?.layoutIfNeeded()
        }
    }
    
    func waitAndClose()
    {
        let deadline:DispatchTime = DispatchTime.now() + VCreateTravelList.Constants.waitToUpdate
        DispatchQueue.main.asyncAfter(deadline:deadline)
        { [weak self] in
            
            self?.controller.back()
        }
    }
}
