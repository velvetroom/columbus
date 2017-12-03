import UIKit

extension MPlansDetail
{
    //MARK: private
    
    private class func factoryStopItem(stop:DPlanStop) -> MPlansDetailItemStop?
    {
        guard
            
            let icon:UIImage = VPlanStop.factoryIcon(stop:stop),
            let title:String = stop.name
            
        else
        {
            return nil
        }
        
        let item:MPlansDetailItemStop = MPlansDetailItemStop(
            icon:icon,
            title:title)
        
        return item
    }
    
    private class func factoryDistanceItem(
        stop:DPlanStop,
        distanceSettings:DSettingsDistance) -> MPlansDetailItemTravel?
    {
        guard
            
            let travel:DPlanTravel = stop.destinationTravel,
            let distance:String = VFormat.factoryDistance(
                travels:[travel],
                distanceSettings:distanceSettings)
            
        else
        {
            return nil
        }
        
        let item:MPlansDetailItemTravel = MPlansDetailItemTravel(title:distance)
        
        return item
    }
    
    private class func factoryDurationItem(stop:DPlanStop) -> MPlansDetailItemTravel?
    {
        guard
            
            let travel:DPlanTravel = stop.destinationTravel,
            let duration:String = VFormat.factoryDuration(travels:[travel])
            
        else
        {
            return nil
        }
        
        let item:MPlansDetailItemTravel = MPlansDetailItemTravel(title:duration)
        
        return item
    }
    
    //MARK: internal
    
    class func factoryItems(
        plan:DPlan,
        settings:DSettings) -> [MPlansDetailItemProtocol]
    {
        let stops:[DPlanStop] = plan.stopsList
        var items:[MPlansDetailItemProtocol] = []
        
        for stop:DPlanStop in stops
        {
            if let itemDistance:MPlansDetailItemTravel = factoryDistanceItem(
                stop:stop,
                distanceSettings:settings.distance)
            {
                items.append(itemDistance)
            }
            
            if let itemDuration:MPlansDetailItemTravel = factoryDurationItem(stop:stop)
            {
                items.append(itemDuration)
            }
            
            if let itemStop:MPlansDetailItemStop = factoryStopItem(stop:stop)
            {
                items.append(itemStop)
            }
        }
        
        return items
    }
}
