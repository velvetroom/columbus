import UIKit

extension VSettingsListCellTravelModeList
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
        
        updateSelector(animationDuration:0)
    }
    
    //MARK: internal
    
    func modelAtIndex(index:IndexPath) -> MSettingsTravelModeProtocol
    {
        let item:MSettingsTravelModeProtocol = model!.items[index.item]
        
        return item
    }
    
    func reload(model:MSettingsTravelMode)
    {
        self.model = model
        
        collectionView.reloadData()
    }
    
    func selectCurrent()
    {
        let deadline:DispatchTime = DispatchTime.now() + VSettingsListCellTravelModeList.Constants.waitToSelect
        DispatchQueue.main.asyncAfter(deadline:deadline)
        { [weak self] in
            
            self?.asyncSelectCurrent()
        }
    }
    
    func updateSelector(animationDuration:TimeInterval)
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
        
        UIView.animate(withDuration:animationDuration)
        { [weak self] in
            
            self?.layoutIfNeeded()
        }
    }
}
