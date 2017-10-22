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
        
            self?.stopAdded(stop:stop)
        }
    }
    
    private func stopAdded(stop:DPlanStop)
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.addAnnotation(stop:stop)
            self?.selectLastStop()
        }
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
    
    private func selectLastStop()
    {
        guard
            
            let view:VCreateStatusReady = model?.view?.view as? VCreateStatusReady,
            let totalStops:Int = plan.stops?.count
            
        else
        {
            return
        }
        
        let lastStop:Int = totalStops - 1
        
        view.viewBar.reload()
        view.viewBar.viewStops.selectItem(
            index:lastStop)
    }
    
    private func updated(stop:DPlanStop)
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.asyncUpdated(stop:stop)
        }
    }
    
    private func asyncUpdated(stop:DPlanStop)
    {
        guard
            
            let view:VCreateStatusReady = model?.view?.view as? VCreateStatusReady
            
        else
        {
            return
        }
        
        view.viewBar.viewStops.updateLocation(
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
    
    func update(stop:DPlanStop)
    {
        let location:CLLocation = MCreatePlan.factoryLocation(
            stop:stop)
        
        geocodeLocation(location:location)
        { [weak self] (name:String?) in
            
            stop.name = name
            
            self?.updated(stop:stop)
        }
    }
}
