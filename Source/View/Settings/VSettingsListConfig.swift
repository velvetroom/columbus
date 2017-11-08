import UIKit

extension VSettingsList
{
    //MARK: internal
    
    func config()
    {
        backgroundColor = UIColor.colourBackgroundGray
        collectionView.alwaysBounceVertical = true
        
        registerCell(
            cell:VSettingsListCellTravelMode.self)
        registerCell(
            cell:VSettingsListCellDetailLevel.self)
        registerCell(
            cell:VSettingsListCellDistance.self)
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.minimumInteritemSpacing = kInterItem
            flow.minimumLineSpacing = kInterItem
            flow.sectionInset = UIEdgeInsets(
                top:kInsetsTop,
                left:0,
                bottom:kCollectionBottom,
                right:0)
        }
    }
}
