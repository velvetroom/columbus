import MapKit

extension VCreateStatusReadyMap
{
    //MARK: internal
    
    func factoryStop(
        stop:DPlanStop) -> VCreateStatusReadyMapPin
    {
        guard
            
            let view:VCreateStatusReadyMapPin = dequeueReusableAnnotationView(
                withIdentifier:
                VCreateStatusReadyMapPin.reusableIdentifier) as? VCreateStatusReadyMapPin
            
        else
        {
            let view:VCreateStatusReadyMapPin = VCreateStatusReadyMapPin(
                stop:stop)
            
            return view
        }
        
        view.annotation = stop
        
        return view
    }
    
    func factoryPin(
        annotation:MKAnnotation) -> MKAnnotationView?
    {
        let annotationView:MKAnnotationView? = view(
            for:annotation)
        
        return annotationView
    }
}
