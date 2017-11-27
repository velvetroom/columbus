import UIKit

final class VHomeReadyBar:View<ArchHome>
{
    weak var viewList:VHomeReadyBarList!
    weak var layoutBottom:NSLayoutConstraint!
    
    required init(controller:CHome)
    {
        super.init(controller:controller)
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
