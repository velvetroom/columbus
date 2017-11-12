import MapKit

final class MCreateSearch:Model<ArchCreateSearch>
{
    private let completer:MKLocalSearchCompleter
    
    required init()
    {
        completer = MKLocalSearchCompleter()
        super.init()
    }
}
