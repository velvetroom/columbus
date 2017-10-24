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
}
