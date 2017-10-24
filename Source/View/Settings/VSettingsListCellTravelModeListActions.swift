import UIKit

extension VSettingsListCellTravelModeList
{
    //MARK: internal
    
    func reload(model:MSettingsTravelMode)
    {
        self.model = model
        
        collectionView.reloadData()
    }
}
