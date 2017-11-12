import MapKit

final class MCreateSearch:Model<ArchCreateSearch>
{
    let completer:MKLocalSearchCompleter
    private let delegate:MCreateSearchCompleterDelegate
    
    required init()
    {
        completer = MKLocalSearchCompleter()
        delegate = MCreateSearchCompleterDelegate()
        completer.delegate = delegate
        
        super.init()
        
        delegate.model = self
    }
}
