import MapKit

extension VCreateStatusReadyMap
{
    //MARK: internal
    
    func mapView(
        _ mapView:MKMapView,
        didSelect view:MKAnnotationView)
    {
        selectedAnnotation(annotation:view)
    }
    
    func mapView(
        _ mapView:MKMapView,
        didDeselect view:MKAnnotationView)
    {
        deselectAnnotation()
    }
    
    func mapView(
        _ mapView:MKMapView,
        annotationView view:MKAnnotationView,
        didChange newState:MKAnnotationViewDragState,
        fromOldState oldState:MKAnnotationViewDragState)
    {
        dragingChanged(
            annotation:view,
            state:newState)
    }
}
