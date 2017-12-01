import UIKit

final class VHomeReadyBarHeader:View<ArchHome>
{
    required init(controller:CHome)
    {
        super.init(controller:controller)
        isUserInteractionEnabled = false
        backgroundColor = UIColor.white
        
        guard
            
            let distance:String = factoryDistance(),
            let duration:String = factoryDuration()
            
        else
        {
            return
        }
        
        factoryViews(
            distance:distance,
            duration:duration)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func factoryDistance() -> String?
    {
        guard
            
            let travels:[DPlanTravel] = controller.model.plan?.plan.travelsList,
            let settings:DSettings = controller.model.settings
            
        else
        {
            return nil
        }
        
        let distance:String? = VFormat.factoryDistance(
            travels:travels,
            distanceSettings:settings.distance)
        
        return distance
    }
    
    private func factoryDuration() -> String?
    {
        guard
            
            let travels:[DPlanTravel] = controller.model.plan?.plan.travelsList
            
        else
        {
            return nil
        }
        
        let duration:String? = VFormat.factoryDuration(travels:travels)
        
        return duration
    }
}
