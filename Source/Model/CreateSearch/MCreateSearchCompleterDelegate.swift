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
        print(completer.results)
    }
}
