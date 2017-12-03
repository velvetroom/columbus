import MapKit

final class MCreateSearch:Model<ArchCreateSearch>
{
    let completer:MKLocalSearchCompleter
    private(set) var items:[MKLocalSearchCompletion]
    private let delegate:MCreateSearchCompleterDelegate
    
    required init()
    {
        completer = MKLocalSearchCompleter()
        delegate = MCreateSearchCompleterDelegate()
        completer.delegate = delegate
        items = []
        
        super.init()
        
        delegate.model = self
    }
    
    //MARK: internal
    
    func updateItems(items:[MKLocalSearchCompletion])
    {
        self.items = items
        view?.updateList()
    }
}
