import MapKit

extension VCreateSearchBaseList
{
    //MARK: internal
    
    func modelAtIndex(index:IndexPath) -> MKLocalSearchCompletion
    {
        let item:MKLocalSearchCompletion = controller.model.items[
            index.item]
        
        return item
    }
}
