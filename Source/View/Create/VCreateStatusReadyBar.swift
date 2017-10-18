import UIKit

final class VCreateStatusReadyBar:View<ArchCreate>
{
    required init(controller:CCreate)
    {
        super.init(controller:controller)
        backgroundColor = UIColor.colourSuccess
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
