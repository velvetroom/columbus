import UIKit

final class VCreateStatusReadyBarStopsFooter:UICollectionReusableView
{
    weak var labelDistance:UILabel!
    weak var labelDuration:UILabel!
    
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
        let distance:String? = VFormat.factoryDistance(
            travels:model,
            distanceSettings:distanceSettings)
        
        let duration:String? = VFormat.factoryDuration(travels:model)
        
        labelDistance.text = distance
        labelDuration.text = duration
    }
}
