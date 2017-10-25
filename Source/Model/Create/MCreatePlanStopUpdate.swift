import Foundation
import CoreLocation

extension MCreatePlan
{
    //MARK: private
    
    private func configTravelOrigin(stop:DPlanStop)
    {
        guard
            
            let travel:DPlanTravel = stop.destinationTravel
            
        else
        {
            configTravelDestination(stop:stop)
            
            return
        }
        
        factoryDirections(travel:travel)
        { [weak self] in
            
            self?.configTravelDestination(
                stop:stop)
        }
    }
    
    private func configTravelDestination(stop:DPlanStop)
    {
        guard
            
            let travel:DPlanTravel = stop.originTravel
            
        else
        {
            update(stop:stop)
            
            return
        }
        
        factoryDirections(travel:travel)
        { [weak self] in
            
            self?.asyncUpdate(stop:stop)
        }
    }
    
    private func asyncUpdate(stop:DPlanStop)
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.updated(stop:stop)
        }
    }
    
    //MARK: internal
    
    func update(stop:DPlanStop)
    {
        let location:CLLocation = MCreatePlan.factoryLocation(
            stop:stop)
        
        geocodeLocation(location:location)
        { [weak self] (name:String?) in
            
            stop.name = name
            
            self?.configTravelOrigin(
                stop:stop)
        }
    }
}
