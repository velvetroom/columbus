import Foundation
import CoreLocation

extension MCreatePlan
{
    //MARK: private
    
    private func addStop(
        name:String,
        coordinate:CLLocationCoordinate2D)
    {
        database.create
        { [weak self] (stop:DPlanStop) in
            
            self?.addStop(
                stop:stop,
                name:name,
                coordinate:coordinate)
        }
    }
    
    private func addStop(
        stop:DPlanStop,
        name:String,
        coordinate:CLLocationCoordinate2D)
    {
        stop.name = name
        stop.coordinate = coordinate
        
        plan.connect(
            database:database,
            stop:stop)
        { [weak self] in
            
            self?.configTravel(stop:stop)
        }
    }
    
    private func configTravel(stop:DPlanStop)
    {
        guard
        
            let travel:DPlanTravel = stop.destinationTravel
        
        else
        {
            return
        }
        
        directions(travel:travel)
        { [weak self] in
            
            self?.stopAdded(stop:stop)
        }
    }
    
    private func stopAdded(stop:DPlanStop)
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.asyncStopAdded(stop:stop)
        }
    }
    
    private func asyncStopAdded(stop:DPlanStop)
    {
        addAnnotation(stop:stop)
        updateStops()
        selectLastStop()
    }
    
    private func addAnnotation(stop:DPlanStop)
    {
        guard
            
            let view:VCreateStatusReady = model?.view?.view as? VCreateStatusReady
            
        else
        {
            return
        }
        
        view.viewMap.addAnnotation(stop)
        view.viewMap.centreAndSelect(
            stop:stop)
    }
    
    //MARK: internal
    
    func addStop(coordinate:CLLocationCoordinate2D)
    {
        let location:CLLocation = MCreatePlan.factoryLocation(
            coordinate:coordinate)
        
        geocodeLocation(location:location)
        { [weak self] (name:String?) in
            
            guard
                
                let name:String = name
                
            else
            {
                return
            }
            
            self?.addStop(
                name:name,
                coordinate:coordinate)
        }
    }
}
