import MapKit

extension VMapPin
{
    //MARK: internal
    
    class func factoryDragState(state:MKAnnotationViewDragState) -> MKAnnotationViewDragState
    {
        guard
            
            let newState:MKAnnotationViewDragState = VMapPin.Constants.dragStateMap[state]
            
        else
        {
            return MKAnnotationViewDragState.none
        }
        
        return newState
    }
}
