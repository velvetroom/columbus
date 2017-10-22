import MapKit

extension VCreateStatusReadyMap
{
    //MARK: internal
    
    func factoryPin(
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
    
    func factoryUser(
        annotation:MKAnnotation) -> MKAnnotationView?
    {
        let annotationView:MKAnnotationView? = view(
            for:annotation)
        
        return annotationView
    }
}
