import MapKit

final class VCreateStatusReadyMap:VMap<ArchCreate>
{
    private(set) weak var mapTiler:VCreateStatusReadyMapTiler!
    
    override init(controller:CCreate)
    {
        super.init(controller:controller)
        
        addTiler()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
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
    
    //MARK: private
    
    private func addTiler()
    {
        let mapTiler:VCreateStatusReadyMapTiler = VCreateStatusReadyMapTiler()
        self.mapTiler = mapTiler
        
        add(
            mapTiler,
            level:MKOverlayLevel.aboveLabels)
    }
}
