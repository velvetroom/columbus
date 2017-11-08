import UIKit

final class VSettingsListCellDetailLevelListRail:
    UIView
{
    private let kCornerRadius:CGFloat = 2
    
    init()
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        isUserInteractionEnabled = false
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.colourBackgroundGray
        layer.cornerRadius = kCornerRadius
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
