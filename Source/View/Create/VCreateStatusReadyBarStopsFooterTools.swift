import Foundation

extension VCreateStatusReadyBarStopsFooter
{
    //MARK: private
    
    private func updateSuffix(
        distanceSettings:DSettingsDistance)
    {
        guard
            
            let suffix:String = distanceSuffixMap[
                distanceSettings]
            
        else
        {
            return
        }
        
        numberFormatter.positiveSuffix = suffix
    }
    
    private func factoryDuration(
        duration:DPlanTravelDuration) -> String
    {
        let amount:String = String(duration.amount)
        
        var string:String = String()
        string.append(amount)
        
        if let suffix:String = durationSuffixMap[duration.type]
        {
            string.append(suffix)
        }
        
        return string
    }
    
    //MARK: internal
    
    func factoryDistance(
        model:[DPlanTravel],
        distanceSettings:DSettingsDistance) -> String?
    {
        updateSuffix(
            distanceSettings:distanceSettings)
        
        let distance:Float = DPlanTravel.factoryDistance(
            travels:model,
            distanceSettings:distanceSettings)
        let distanceNumber:NSNumber = NSNumber(value:distance)
        let distanceString:String? = numberFormatter.string(
            from:distanceNumber)
        
        return distanceString
    }
    
    func factoryDuration(
        model:[DPlanTravel]) -> String
    {
        let duration:DPlanTravelDuration = DPlanTravelDuration.factoryDuration(
            travels:model)
        let durationString:String = factoryDuration(
            duration:duration)
        
        return durationString
    }
}
