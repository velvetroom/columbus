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
    
    func avoidInteraction()
    {
        view?.isUserInteractionEnabled = false
    }
    
    func enableInteraction()
    {
        view?.isUserInteractionEnabled = true
    }
    
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
        
        removeTravels(stop:stop)
    }
    
    func updated(stop:DPlanStop)
    {
        view?.viewBar.viewStops.updateFooter()
        view?.viewBar.viewStops.updateLocation(
            stop:stop)
    }
    
    func removeTravels(stop:DPlanStop)
    {
        if let origin:DPlanTravel = stop.originTravel
        {
            removeTravel(travel:origin)
        }
        
        if let destination:DPlanTravel = stop.destinationTravel
        {
            removeTravel(travel:destination)
        }
    }
    
    func removeTravel(travel:DPlanTravel)
    {
        view?.viewMap.removeRoute(travel:travel)
    }
    
    func addTravel(travel:DPlanTravel)
    {        
        view?.viewMap.addRoute(
            travel:travel)
    }
}
