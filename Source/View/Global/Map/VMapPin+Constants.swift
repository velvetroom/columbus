import MapKit

extension VMapPin
{
    struct Constants
    {
        static let dragStateMap:[MKAnnotationViewDragState:MKAnnotationViewDragState] = [
            MKAnnotationViewDragState.starting : MKAnnotationViewDragState.dragging]
        
        static let imageOffsetY:CGFloat = 0
        static let imageDragginOffsetY:CGFloat = 60
        static let animationDuration:TimeInterval = 0.3
    }
}
