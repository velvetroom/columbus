import MapKit

final class VCreateStatusReadyMap:VMap<ArchCreate>
{
    override func mapView(
        _ mapView:MKMapView,
        didSelect view:MKAnnotationView)
    {
        selectedAnnotation(annotation:view)
    }
    
    override func mapView(
        _ mapView:MKMapView,
        didDeselect view:MKAnnotationView)
    {
        deselectAnnotation()
    }
    
    override func mapView(
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
