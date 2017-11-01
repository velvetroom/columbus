import UIKit

extension VSettingsListCellDetailLevelList
{
    //MARK: private
    
    private func asyncSelectCurrent()
    {
        guard
            
            let index:Int = model?.selectedIndex
            
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
    
    func modelAtIndex(
        index:IndexPath) -> MSettingsDetailLevelProtocol
    {
        let item:MSettingsDetailLevelProtocol = model!.items[
            index.item]
        
        return item
    }
    
    func reload(model:MSettingsDetailLevel)
    {
        self.model = model
        
        collectionView.reloadData()
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
        
        let cellY:CGFloat = cell.center.y
        layoutSelectorTop.constant = cellY - selectorHeight_2
        
        UIView.animate(withDuration:kAnimationDuration)
        { [weak self] in
            
            self?.layoutIfNeeded()
        }
    }
}
