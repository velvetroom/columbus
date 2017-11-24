import UIKit

final class VHomeReadyBar:View<ArchHome>
{
    required init(controller:CHome)
    {
        super.init(controller:controller)
        backgroundColor = UIColor.white
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
