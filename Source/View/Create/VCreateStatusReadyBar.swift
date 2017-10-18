import UIKit

final class VCreateStatusReadyBar:View<ArchCreate>
{
    weak var layoutHeight:NSLayoutConstraint!
    let kMaxHeight:CGFloat = 200
    let kBorderHeight:CGFloat = 1
    
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
