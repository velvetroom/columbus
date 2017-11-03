import UIKit

final class VCreateStatusReadyBarStopsFooter:
    UICollectionReusableView
{
    weak var labelDistanceValue:UILabel!
    weak var labelDurationValue:UILabel!
    let distanceSuffixMap:[DSettingsDistance:String]
    let durationSuffixMap:[DPlanTravelDurationType:String]
    let numberFormatter:NumberFormatter
    let kTitleFontSize:CGFloat = 15
    let kValueFontSize:CGFloat = 13
    let kTitleLeft:CGFloat = 60
    let kTitleWidth:CGFloat = 80
    let kValueLeft:CGFloat = -15
    let kValueWidth:CGFloat = 250
    let kDistanceTop:CGFloat = 30
    let kLabelHeight:CGFloat = 30
    private let kMinIntegers:Int = 1
    private let kMaxDecimals:Int = 1
    
    override init(frame:CGRect)
    {
        distanceSuffixMap = VCreateStatusReadyBarStopsFooter.factoryDistanceSuffixMap()
        durationSuffixMap = VCreateStatusReadyBarStopsFooter.factoryDurationSuffixMap()
        numberFormatter = VCreateStatusReadyBarStopsFooter.factoryNumberFormatter(
            minIntegers:kMinIntegers,
            maxDecimals:kMaxDecimals)
        
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
        let duration:String = factoryDuration(
            model:model)
        
        labelDistanceValue.text = distance
        labelDurationValue.text = duration
    }
}
