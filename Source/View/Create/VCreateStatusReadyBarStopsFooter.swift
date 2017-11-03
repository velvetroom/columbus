import UIKit

final class VCreateStatusReadyBarStopsFooter:
    UICollectionReusableView
{
    weak var labelDistanceValue:UILabel!
    weak var labelDurationValue:UILabel!
    let kTitleFontSize:CGFloat = 15
    let kValueFontSize:CGFloat = 13
    let kTitleLeft:CGFloat = 60
    let kTitleWidth:CGFloat = 80
    let kValueLeft:CGFloat = -15
    let kValueWidth:CGFloat = 250
    let kDistanceTop:CGFloat = 30
    let kLabelHeight:CGFloat = 30
    private let suffixMap:[DSettingsDistance:String]
    private let numberFormatter:NumberFormatter
    private let kMinIntegers:Int = 1
    private let kMaxDecimals:Int = 1
    
    override init(frame:CGRect)
    {
        numberFormatter = NumberFormatter()
        numberFormatter.minimumIntegerDigits = kMinIntegers
        numberFormatter.maximumFractionDigits = kMaxDecimals
        
        suffixMap = [
            DSettingsDistance.kilometres:
                String.localizedView(
                    key:"VCreateStatusReadyBarStopsFooter_kilometres"),
            DSettingsDistance.miles:
                String.localizedView(
                    key:"VCreateStatusReadyBarStopsFooter_miles")]
        
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func updateSuffix(
        distanceSettings:DSettingsDistance)
    {
        guard
        
            let suffix:String = suffixMap[
                distanceSettings]
        
        else
        {
            return
        }
        
        numberFormatter.positiveSuffix = suffix
    }
    
    private func factoryDistance(
        model:[DPlanTravel],
        distanceSettings:DSettingsDistance) -> String?
    {
        let distance:Float = DPlanTravel.factoryDistance(
            travels:model,
            distanceSettings:distanceSettings)
        let distanceNumber:NSNumber = NSNumber(value:distance)
        let distanceString:String? = numberFormatter.string(
            from:distanceNumber)
        
        return distanceString
    }
    
    //MARK: internal
    
    func config(
        model:[DPlanTravel],
        distanceSettings:DSettingsDistance)
    {
        updateSuffix(
            distanceSettings:distanceSettings)
        
        let distance:String? = factoryDistance(
            model:model,
            distanceSettings:distanceSettings)
        
        labelDistanceValue.text = distance
    }
}
