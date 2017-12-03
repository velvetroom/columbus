import UIKit

final class VSettingsMemorySpinner:UIImageView
{
    init()
    {
        super.init(frame:CGRect.zero)
        isUserInteractionEnabled = false
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        animationDuration = VSettingsMemorySpinner.Constants.animationDuration
        animationImages = VSettingsMemorySpinner.Constants.images
        alpha = VSettingsMemorySpinner.Constants.alpha
        contentMode = UIViewContentMode.center
        startAnimating()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
