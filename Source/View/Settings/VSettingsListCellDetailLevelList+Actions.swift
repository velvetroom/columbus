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
        
        let item:MSettingsDetailLevelProtocol = modelAtIndex(index:indexPath)
        
        collectionView.selectItem(
            at:indexPath,
            animated:false,
            scrollPosition:UICollectionViewScrollPosition())
        
        updateLabel(item:item)
        updateSelector()
    }
    
    //MARK: internal
    
    func modelAtIndex(index:IndexPath) -> MSettingsDetailLevelProtocol
    {
        let item:MSettingsDetailLevelProtocol = model!.items[index.item]
        
        return item
    }
    
    func reload(model:MSettingsDetailLevel)
    {
        self.model = model
        
        collectionView.reloadData()
    }
    
    func selectCurrent()
    {
        let deadline:DispatchTime = DispatchTime.now() + VSettingsListCellDetailLevelList.Constants.waitToSelect
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
        
        let cellY:CGFloat = cell.center.y
        layoutSelectorTop.constant = cellY - selectorHeight_2
        
        UIView.animate(withDuration:VSettingsListCellDetailLevelList.Constants.animationDuration)
        { [weak self] in
            
            self?.layoutIfNeeded()
        }
    }
}
