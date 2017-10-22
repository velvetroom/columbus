import MapKit

extension VCreateStatusReadyMap
{
    //MARK: internal

    func dragingChanged(
        annotation:MKAnnotationView,
        state:MKAnnotationViewDragState)
    {
        guard
            
            state == MKAnnotationViewDragState.none,
            let stop:DPlanStop = annotation.annotation as? DPlanStop,
            let view:VCreateStatusReady = controller.model.view?.view as? VCreateStatusReady
            
        else
        {
            return
        }
        
        view.viewBar.viewStops.updateLocation(
            stop:stop)
    }
}
