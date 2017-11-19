import UIKit

final class VSettingsMemorySpinner:UIImageView
{
    init()
    {
        super.init(frame:CGRect.zero)
        isUserInteractionEnabled = false
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        animationDuration = VSpinner.Constants.animationDuration
        animationImages = VSpinner.Constants.images
        contentMode = UIViewContentMode.center
        startAnimating()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
