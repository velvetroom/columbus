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
            
            self?.asyncAdd(travel:travel)
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
            asyncUpdate(stop:stop)
            
            return
        }
        
        factoryDirections(travel:travel)
        { [weak self] in
            
            self?.asyncAdd(travel:travel)
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
    
    private func asyncRemoveTravels(stop:DPlanStop)
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.removeTravels(stop:stop)
        }
    }
    
    private func asyncAdd(travel:DPlanTravel)
    {
        DispatchQueue.main.async
        { [weak self] in
                
            self?.addTravel(travel:travel)
        }
    }
    
    //MARK: internal
    
    func update(stop:DPlanStop)
    {
        let location:CLLocation = stop.location
        asyncRemoveTravels(stop:stop)
        
        geocodeLocation(location:location)
        { [weak self] (name:String?) in
            
            stop.name = name

            self?.configTravelOrigin(stop:stop)
        }
    }
}
