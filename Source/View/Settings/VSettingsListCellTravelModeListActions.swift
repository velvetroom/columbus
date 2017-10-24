import UIKit

extension VSettingsListCellTravelModeList
{
    //MARK: private
    
    private func asyncSelectCurrent()
    {
        guard
            
            let travelMode:DPlanTravelMode = model?.settings.travelMode,
            let index:Int = model?.indexMap[travelMode]
            
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
    }
    
    //MARK: internal
    
    func modelAtIndex(
        index:IndexPath) -> MSettingsTravelModeProtocol
    {
        let item:MSettingsTravelModeProtocol = model!.items[
            index.item]
        
        return item
    }
    
    func reload(model:MSettingsTravelMode)
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
}
