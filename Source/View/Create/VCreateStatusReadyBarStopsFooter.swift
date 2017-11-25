import UIKit

final class VCreateStatusReadyBarStopsFooter:UICollectionReusableView
{
    weak var labelDistanceValue:UILabel!
    weak var labelDurationValue:UILabel!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: internal
    
    func config(
        model:[DPlanTravel],
        distanceSettings:DSettingsDistance)
    {
        let distance:String? = VCreateStatusReadyBarStopsFooter.factoryDistance(
            model:model,
            distanceSettings:distanceSettings)
        
        let duration:String? = VCreateStatusReadyBarStopsFooter.factoryDuration(model:model)
        
        labelDistanceValue.text = distance
        labelDurationValue.text = duration
    }
}
