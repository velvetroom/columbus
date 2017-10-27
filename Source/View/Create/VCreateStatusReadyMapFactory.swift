import MapKit

extension VCreateStatusReadyMap
{
    //MARK: private
    
    private func factoryRenderer(
        mapTiler:VCreateStatusReadyMapTiler) -> MKOverlayRenderer
    {
        let tileRenderer:MKTileOverlayRenderer = MKTileOverlayRenderer(
            tileOverlay:mapTiler)
        
        return tileRenderer
    }
    
    private func factoryRenderer(
        polyline:MKPolyline) -> MKOverlayRenderer
    {
        let renderer:MKPolylineRenderer = MKPolylineRenderer(
            polyline:polyline)
        renderer.lineWidth = kRendererWidth
        renderer.strokeColor = rendererStrokeColour
        renderer.lineDashPattern = kRendererLineDash
        
        return renderer
    }
    
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
    
    func factoryRenderer(
        overlay:MKOverlay) -> MKOverlayRenderer
    {
        let renderer:MKOverlayRenderer
        
        if let polyline:MKPolyline = overlay as? MKPolyline
        {
            renderer = factoryRenderer(polyline:polyline)
        }
        else if let mapTiler:VCreateStatusReadyMapTiler = overlay as? VCreateStatusReadyMapTiler
        {
            renderer = factoryRenderer(mapTiler:mapTiler)
        }
        else
        {
            renderer = MKOverlayRenderer()
        }
        
        return renderer
    }
}
