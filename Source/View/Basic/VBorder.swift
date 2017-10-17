import UIKit

final class VBorder:UIView
{
    init(colour:UIColor)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        isUserInteractionEnabled = false
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = colour
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
