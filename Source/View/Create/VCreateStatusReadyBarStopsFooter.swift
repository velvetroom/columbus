import UIKit

final class VCreateStatusReadyBarStopsFooter:
    UICollectionReusableView
{
    weak var labelDistanceValue:UILabel!
    weak var labelDurationValue:UILabel!
    let distanceSuffixMap:[DSettingsDistance:String]
    let durationSuffixMap:[DPlanTravelDurationType:String]
    let numberFormatter:NumberFormatter
    let kValueFontSize:CGFloat = 13
    let kIconMarginHorizontal:CGFloat = 4
    let kIconWidth:CGFloat = 44
    let kValueWidth:CGFloat = 250
    let kContentTop:CGFloat = 8
    let kLabelHeight:CGFloat = 36
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
        let duration:String? = factoryDuration(
            model:model)
        
        labelDistanceValue.text = distance
        labelDurationValue.text = duration
    }
}
