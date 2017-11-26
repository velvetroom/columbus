import UIKit

final class VHomeReady:View<ArchHome>
{
    weak var viewMap:VHomeReadyMap!
    weak var viewBar:VHomeReadyBar!
    weak var layoutBarBottom:NSLayoutConstraint!
    
    required init(controller:CHome)
    {
        super.init(controller:controller)
        
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: internal
    
    func toast(message:String)
    {
        
    }
}
