import Foundation
import CoreLocation

extension MCreatePlan
{
    //MARK: private
    
    private func addStop(
        stop:DPlanStop,
        coordinate:CLLocationCoordinate2D)
    {
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
        
        view.viewMap.addStop(stop:stop)
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
    
    //MARK: internal
    
    func addStop(coordinate:CLLocationCoordinate2D)
    {
        database.create
        { [weak self] (stop:DPlanStop) in
            
            self?.addStop(
                stop:stop,
                coordinate:coordinate)
        }
    }
}
