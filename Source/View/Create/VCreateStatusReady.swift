import UIKit

final class VCreateStatusReady:View<ArchCreate>
{
    weak var viewMap:VCreateStatusReadyMap!
    let kBottom:CGFloat = -50
    let kRoutePreviewWidth:CGFloat = 80
    
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
