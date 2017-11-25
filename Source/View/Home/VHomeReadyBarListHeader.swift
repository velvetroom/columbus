import UIKit

final class VHomeReadyBarListHeader:UICollectionReusableView
{
    weak var labelDistance:UILabel!
    weak var labelDuration:UILabel!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.white
        isUserInteractionEnabled = false
        
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: internal
    
    func config(controller:CHome)
    {
        guard
            
            let travels:[DPlanTravel] = controller.model.plan?.plan.travels?.array as? [DPlanTravel],
            let settings:DSettings = controller.model.settings
        
        else
        {
            return
        }
        
        let distance:String? = VCreateStatusReadyBarStopsFooter.factoryDistance(
            model:travels,
            distanceSettings:settings.distance)
        
        let duration:String? = VCreateStatusReadyBarStopsFooter.factoryDuration(model:travels)
        
        labelDistance.text = distance
        labelDuration.text = duration
    }
}
