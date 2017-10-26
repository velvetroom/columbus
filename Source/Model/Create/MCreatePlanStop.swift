import MapKit

extension MCreatePlan
{
    private var view:VCreateStatusReady?
    {
        get
        {
            return model?.view?.view as? VCreateStatusReady
        }
    }
    
    //MARK: internal
    
    func updateStops()
    {
        view?.viewBar.reload()
    }
    
    func selectLastStop()
    {
        guard
            
            let totalStops:Int = plan.stops?.count
            
        else
        {
            return
        }
        
        let lastStop:Int = totalStops - 1
        view?.viewBar.viewStops.selectItem(
            index:lastStop)
    }
    
    func addAnnotation(stop:DPlanStop)
    {
        view?.viewMap.addStop(stop:stop)
    }
    
    func removeAnnotation(stop:DPlanStop)
    {
        view?.viewMap.removeAnnotation(stop)
    }
    
    func updated(stop:DPlanStop)
    {
        view?.viewBar.viewStops.updateLocation(
            stop:stop)
    }
    
    func removeTravel(travel:DPlanTravel)
    {
        guard
            
            let route:MKPolyline = travel.polyline
        
        else
        {
            return
        }
        
        view?.viewMap.remove(
            route)
    }
    
    func addTravel(travel:DPlanTravel)
    {        
        view?.viewMap.addRoute(
            travel:travel)
    }
}
