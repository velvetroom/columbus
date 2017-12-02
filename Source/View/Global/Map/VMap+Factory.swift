import MapKit

extension VMap
{
    //MARK: private
    
    private func factoryRenderer(polyline:MKPolyline) -> MKOverlayRenderer
    {
        let renderer:MKPolylineRenderer = MKPolylineRenderer(
            polyline:polyline)
        renderer.lineWidth = VMap.Constants.rendererWidth
        renderer.strokeColor = rendererStrokeColour
        renderer.lineDashPattern = VMap.Constants.rendererLineDash
        
        return renderer
    }
    
    //MARK: internal
    
    final func factoryPin(stop:DPlanStop) -> VMapPin
    {
        guard
            
            let view:VMapPin = dequeueReusableAnnotationView(
                withIdentifier:
                VMapPin.reusableIdentifier) as? VMapPin
            
        else
        {
            let view:VMapPin = VMapPin(stop:stop)
            
            return view
        }
        
        view.annotation = stop
        
        return view
    }
    
    final func factoryUser(annotation:MKAnnotation) -> MKAnnotationView?
    {
        let annotationView:MKAnnotationView? = view(for:annotation)
        
        return annotationView
    }
    
    func factoryRenderer(overlay:MKOverlay) -> MKOverlayRenderer
    {
        let renderer:MKOverlayRenderer
        
        if let polyline:MKPolyline = overlay as? MKPolyline
        {
            renderer = factoryRenderer(polyline:polyline)
        }
        else if let tile:MKTileOverlay = overlay as? MKTileOverlay
        {
            renderer = MKTileOverlayRenderer(tileOverlay:tile)
        }
        else
        {
            renderer = MKOverlayRenderer()
        }
        
        return renderer
    }
}
