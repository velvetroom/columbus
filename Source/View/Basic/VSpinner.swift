import UIKit

final class VSpinner:UIImageView
{
    private let kAnimationDuration:TimeInterval = 1
    
    init()
    {
        super.init(frame:CGRect.zero)
        
        let images:[UIImage] = [
            #imageLiteral(resourceName: "assetSpinner0"),
            #imageLiteral(resourceName: "assetSpinner1"),
            #imageLiteral(resourceName: "assetSpinner2"),
            #imageLiteral(resourceName: "assetSpinner3"),
            #imageLiteral(resourceName: "assetSpinner4"),
            #imageLiteral(resourceName: "assetSpinner5"),
            #imageLiteral(resourceName: "assetSpinner6"),
            #imageLiteral(resourceName: "assetSpinner7"),
            #imageLiteral(resourceName: "assetSpinner8"),
            #imageLiteral(resourceName: "assetSpinner9"),
            #imageLiteral(resourceName: "assetSpinner10"),
            #imageLiteral(resourceName: "assetSpinner11"),
            #imageLiteral(resourceName: "assetSpinner12"),
            #imageLiteral(resourceName: "assetSpinner13"),
            #imageLiteral(resourceName: "assetSpinner14"),
            #imageLiteral(resourceName: "assetSpinner15"),
            #imageLiteral(resourceName: "assetSpinner16")]
        
        isUserInteractionEnabled = false
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        animationDuration = kAnimationDuration
        animationImages = images
        contentMode = UIViewContentMode.center
        startAnimating()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
