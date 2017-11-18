import UIKit

final class VCreateStatusReadyBarStopsFooter:UICollectionReusableView
{
    weak var labelDistanceValue:UILabel!
    weak var labelDurationValue:UILabel!
    let distanceSuffixMap:[DSettingsDistance:String]
    let durationSuffixMap:[DPlanTravelDurationType:String]
    let numberFormatter:NumberFormatter
    
    override init(frame:CGRect)
    {
        distanceSuffixMap = VCreateStatusReadyBarStopsFooter.factoryDistanceSuffixMap()
        durationSuffixMap = VCreateStatusReadyBarStopsFooter.factoryDurationSuffixMap()
        numberFormatter = VCreateStatusReadyBarStopsFooter.factoryNumberFormatter()
        
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
        let distance:String? = factoryDistance(
            model:model,
            distanceSettings:distanceSettings)
        
        let duration:String? = factoryDuration(model:model)
        
        labelDistanceValue.text = distance
        labelDurationValue.text = duration
    }
}
