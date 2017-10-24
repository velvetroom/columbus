import UIKit

final class VSettingsListCellTravelModeListSelector:
    UIView
{
    init()
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        isUserInteractionEnabled = false
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.colourBackgroundDark
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        let width_2:CGFloat = bounds.width / 2.0
        layer.cornerRadius = width_2
        
        super.layoutSubviews()
    }
}
