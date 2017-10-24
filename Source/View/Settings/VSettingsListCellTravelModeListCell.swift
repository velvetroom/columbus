import UIKit

final class VSettingsListCellTravelModeListCell:
    UICollectionViewCell
{
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: internal
    
    func config(model:MSettingsTravelModeProtocol)
    {
        
    }
}
