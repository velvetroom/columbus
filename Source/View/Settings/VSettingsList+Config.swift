import UIKit

extension VSettingsList
{
    //MARK: internal
    
    func config()
    {
        backgroundColor = UIColor.colourBackgroundGray
        collectionView.alwaysBounceVertical = true
        
        registerCell(cell:VSettingsListCellTravelMode.self)
        registerCell(cell:VSettingsListCellDetailLevel.self)
        registerCell(cell:VSettingsListCellDistance.self)
        registerCell(cell:VSettingsListCellStorage.self)
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.minimumInteritemSpacing = VSettingsList.Constants.interItem
            flow.minimumLineSpacing = VSettingsList.Constants.interItem
            flow.sectionInset = UIEdgeInsets(
                top:ViewMain.Constants.barHeight,
                left:0,
                bottom:ViewMain.Constants.menuHeight,
                right:0)
        }
    }
}
