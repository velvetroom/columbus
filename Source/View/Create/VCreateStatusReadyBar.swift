import UIKit

final class VCreateStatusReadyBar:View<ArchCreate>
{
    weak var layoutTop:NSLayoutConstraint!
    let kHeight:CGFloat = 330
    let kBorderHeight:CGFloat = 1
    let kAnimationDuration:TimeInterval = 0.8
    
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
