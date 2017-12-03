import UIKit

final class VCreateStatusReadyBar:View<ArchCreate>
{
    weak var viewStops:VCreateStatusReadyBarStops!
    weak var viewTravel:VCreateStatusReadyBarTravel!
    weak var viewLoader:VCreateStatusReadyBarLoader!
    weak var layoutTop:NSLayoutConstraint!
    
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
