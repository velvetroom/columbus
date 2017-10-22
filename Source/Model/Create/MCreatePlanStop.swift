import Foundation
import CoreLocation

extension MCreatePlan
{
    //MARK: private
    
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
    
    func updateStops()
    {
        guard
            
            let view:VCreateStatusReady = model?.view?.view as? VCreateStatusReady
            
        else
        {
            return
        }
        
        view.viewBar.reload()
    }
    
    func selectLastStop()
    {
        guard
            
            let view:VCreateStatusReady = model?.view?.view as? VCreateStatusReady,
            let totalStops:Int = plan.stops?.count
            
        else
        {
            return
        }
        
        let lastStop:Int = totalStops - 1
        view.viewBar.viewStops.selectItem(
            index:lastStop)
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
