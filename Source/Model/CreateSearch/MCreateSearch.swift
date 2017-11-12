import Foundation

final class MCreateSearch:Model<ArchCreateSearch>
{
    let completer:Any?
    
    required init()
    {
        completer = MCreateSearch.factoryCompleter()
        
        super.init()
    }
}
