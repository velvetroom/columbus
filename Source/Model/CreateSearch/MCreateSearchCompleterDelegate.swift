import MapKit

final class MCreateSearchCompleterDelegate:
    NSObject,
    MKLocalSearchCompleterDelegate
{
    weak var model:MCreateSearch?
    
    //MARK: delegate
    
    func completerDidUpdateResults(
        _ completer:MKLocalSearchCompleter)
    {
        let items:[MKLocalSearchCompletion] = completer.results
        
        model?.updateItems(items:items)
    }
}
