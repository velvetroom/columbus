import UIKit

final class VCreateStatusReady:View<ArchCreate>
{
    weak var viewMap:VCreateStatusReadyMap!
    weak var viewBar:VCreateStatusReadyBar!
    let kBottom:CGFloat = -50
    
    required init(controller:CCreate)
    {
        super.init(controller:controller)
        
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
