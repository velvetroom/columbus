import UIKit

final class VSettingsListCellDetailLevelListRail:UIView
{
    init()
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        isUserInteractionEnabled = false
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.colourBackgroundGray
        layer.cornerRadius = VSettingsListCellDetailLevelListRail.Constants.cornerRadius
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
