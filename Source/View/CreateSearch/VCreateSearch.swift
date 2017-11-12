import UIKit

final class VCreateSearch:ViewMain
{
    weak var viewList:VCreateSearchList!
    let kAnimationDuration:TimeInterval = 0.3
    
    required init(controller:UIViewController)
    {
        super.init(controller:controller)
        backgroundColor = UIColor.clear
        
        guard
        
            let controller:CCreateSearch = controller as? CCreateSearch
        
        else
        {
            return
        }
        
        factoryViews(controller:controller)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
