import Foundation

extension VCreateStatusReadyBarStopsFooter
{
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
    
    private func factoryDuration(
        duration:TimeInterval) -> String
    {
        let durationString:String = durationAsString(
            duration:duration)
        let suffix:String = factorySuffix(
            duration:duration)
        
        var string:String = String()
        string.append(durationString)
        string.append(suffix)
        
        return string
    }
    
    private func durationAsString(
        duration:TimeInterval) -> String
    {
        let durationInteger:Int = Int(duration)
        let string:String = "\(durationInteger)"
        
        return string
    }
    
    private func factorySuffix(
        duration:TimeInterval) -> String
    {
        let suffix:String
        
        if duration > kSecondsInDay
        {
            suffix = String.localizedView(
                key:"VCreateStatusReadyBarStopsFooter_durationDays")
        }
        else if duration > kSecondsInHour
        {
            suffix = String.localizedView(
                key:"VCreateStatusReadyBarStopsFooter_durationHours")
        }
        else if duration > kSecondsInMinute
        {
            suffix = String.localizedView(
                key:"VCreateStatusReadyBarStopsFooter_durationMinutes")
        }
        else
        {
            suffix = String.localizedView(
                key:"VCreateStatusReadyBarStopsFooter_durationSeconds")
        }
        
        return suffix
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
        let duration:TimeInterval = DPlanTravel.factoryDuration(
            travels:model)
        let durationString:String = factoryDuration(
            duration:duration)
        
        return durationString
    }
}
