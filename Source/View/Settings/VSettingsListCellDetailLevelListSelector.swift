import UIKit

final class VSettingsListCellDetailLevelListSelector:
    UIView
{
    private let kCornerRadius:CGFloat = 6
    
    init()
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        isUserInteractionEnabled = false
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.colourBackgroundDark
        layer.cornerRadius = kCornerRadius
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
