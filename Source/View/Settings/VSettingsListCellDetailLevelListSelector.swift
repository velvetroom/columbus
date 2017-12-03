import UIKit

final class VSettingsListCellDetailLevelListSelector:UIView
{
    init()
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        isUserInteractionEnabled = false
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.colourBackgroundDark
        layer.cornerRadius = VSettingsListCellDetailLevelListSelector.Constants.cornerRadius
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
