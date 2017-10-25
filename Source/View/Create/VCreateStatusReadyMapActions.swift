import MapKit

extension VCreateStatusReadyMap
{
    //MARK: private
    
    private func selectedAnnotation(
        view:VCreateStatusReady,
        annotation:MKAnnotation)
    {
        guard
        
            let stop:DPlanStop = annotation as? DPlanStop
        
        else
        {
            view.viewBar.viewStops.deselectAll()
            
            return
        }
        
        view.viewBar.viewStops.selectItem(
            stop:stop)
    }
    
    //MARK: internal
    
    func selectedAnnotation(annotation:MKAnnotationView)
    {
        guard
        
            let view:VCreateStatusReady = controller.model.view?.view as? VCreateStatusReady,
            let annotation:MKAnnotation = annotation.annotation
        
        else
        {
            return
        }
        
        selectedAnnotation(
            view:view,
            annotation:annotation)
    }
    
    func deselectAnnotation()
    {
        guard
            
            let view:VCreateStatusReady = controller.model.view?.view as? VCreateStatusReady
            
        else
        {
            return
        }
        
        view.viewBar.viewStops.deselectAll()
    }
    
    func addStop(stop:DPlanStop)
    {
        addAnnotation(stop)
        centreAndSelect(
            stop:stop)
        
        guard
            
            let travel:DPlanTravel = stop.destinationTravel
            
        else
        {
            return
        }
        
        addRoute(travel:travel)
    }
    
    func addRoute(travel:DPlanTravel)
    {
        guard
            
            let route:MKPolyline = travel.route
            
        else
        {
            return
        }
        
        add(
            route,
            level:MKOverlayLevel.aboveRoads)
    }
}
