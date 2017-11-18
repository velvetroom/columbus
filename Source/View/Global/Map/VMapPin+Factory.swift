import MapKit

extension VMapPin
{
    private static let kDragStateMap:[MKAnnotationViewDragState:MKAnnotationViewDragState] = [
            MKAnnotationViewDragState.starting : MKAnnotationViewDragState.dragging]
    
    //MARK: internal
    
    class func factoryDragState(state:MKAnnotationViewDragState) -> MKAnnotationViewDragState
    {
        guard
            
            let newState:MKAnnotationViewDragState = kDragStateMap[state]
            
        else
        {
            return MKAnnotationViewDragState.none
        }
        
        return newState
    }
}
