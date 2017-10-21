import UIKit

final class VCreateStatusReadyBar:View<ArchCreate>
{
    weak var viewStops:VCreateStatusReadyBarStops!
    weak var viewTravel:VCreateStatusReadyBarTravel!
    weak var layoutTop:NSLayoutConstraint!
    let kHeight:CGFloat = 330
    let kBorderHeight:CGFloat = 1
    let kContentTop:CGFloat = 20
    let kContentBottom:CGFloat = -5
    let kTravelWidth:CGFloat = 80
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
