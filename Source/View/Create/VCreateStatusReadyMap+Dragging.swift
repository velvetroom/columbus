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
            let stop:DPlanStop = annotation.annotation as? DPlanStop
            
        else
        {
            return
        }
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.controller.model.plan?.update(stop:stop)
        }
    }
}
