import UIKit

final class VCreateStatusReadyBar:View<ArchCreate>
{
    weak var layoutHeight:NSLayoutConstraint!
    let kMaxHeight:CGFloat = 330
    let kMinHeight:CGFloat = 20
    let kBorderHeight:CGFloat = 1
    let kAnimationDuration:TimeInterval = 0.3
    
    required init(controller:CCreate)
    {
        super.init(controller:controller)
        backgroundColor = UIColor.colourSuccess
        
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
