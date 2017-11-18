import Foundation

extension VCreateStatusReadyBarStopsFooter
{
    //MARK: private
    
    private func updateDistanceSuffix(
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
    
    private func updateDurationSuffix(
        durationType:DPlanTravelDurationType)
    {
        guard
            
            let suffix:String = durationSuffixMap[
                durationType]
            
        else
        {
            return
        }
        
        numberFormatter.positiveSuffix = suffix
    }
    
    private func factoryDuration(
        duration:DPlanTravelDuration) -> String?
    {
        updateDurationSuffix(
            durationType:duration.type)
        
        let number:NSNumber = NSNumber(
            value:duration.amount)
        let string:String? = numberFormatter.string(
            from:number)
        
        return string
    }
    
    //MARK: internal
    
    func factoryDistance(
        model:[DPlanTravel],
        distanceSettings:DSettingsDistance) -> String?
    {
        updateDistanceSuffix(
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
        model:[DPlanTravel]) -> String?
    {
        let duration:DPlanTravelDuration = DPlanTravelDuration.factoryDuration(
            travels:model)
        let durationString:String? = factoryDuration(
            duration:duration)
        
        return durationString
    }
}
