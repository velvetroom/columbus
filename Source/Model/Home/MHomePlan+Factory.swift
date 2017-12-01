import UIKit

extension MHomePlan
{
    //MARK: private
    
    private class func factoryStopItem(stop:DPlanStop) -> MHomePlanItemStop?
    {
        guard
            
            let icon:UIImage = VPlanStop.factoryIcon(stop:stop),
            let title:String = stop.name
        
        else
        {
            return nil
        }
        
        let item:MHomePlanItemStop = MHomePlanItemStop(
            stop:stop,
            icon:icon,
            title:title)
        
        return item
    }
    
    private class func factoryTravelItem(stop:DPlanStop) -> MHomePlanItemTravel?
    {
        guard
            
            let travel:DPlanTravel = stop.destinationTravel,
            let duration:String = VFormat.factoryDuration(travels:[travel])
        
        else
        {
            return nil
        }
        
        let item:MHomePlanItemTravel = MHomePlanItemTravel(title:duration)
        
        return item
    }
    
    //MARK: internal
    
    class func factoryItems(plan:DPlan) -> [MHomePlanItemProtocol]
    {
        let stops:[DPlanStop] = plan.stopsArray
        var items:[MHomePlanItemProtocol] = []
        
        for stop:DPlanStop in stops
        {
            if let itemTravel:MHomePlanItemTravel = factoryTravelItem(stop:stop)
            {
                items.append(itemTravel)
            }
            
            if let itemStop:MHomePlanItemStop = factoryStopItem(stop:stop)
            {
                items.append(itemStop)
            }
        }
        
        return items
    }
}
