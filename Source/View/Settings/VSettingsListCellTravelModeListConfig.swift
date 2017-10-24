import UIKit

extension VSettingsListCellTravelModeList
{
    //MARK: internal
    
    func config()
    {
        collectionView.isScrollEnabled = false
        collectionView.bounces = false
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.scrollDirection = UICollectionViewScrollDirection.horizontal
        }
    }
    
    func modelAtIndex(index:IndexPath) -> MSettingsTravelModeProtocol
    {
        let item:MSettingsTravelModeProtocol = model!.items[
            index.item]
        
        return item
    }
}
