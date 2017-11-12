import MapKit

extension MCreateSearch
{
    //MARK: internal
    
    class func factoryCompleter() -> Any?
    {
        guard
            
            #available(iOS 9.3, *)
            
        else
        {
            return nil
        }
        
        let completer:MKLocalSearchCompleter = MKLocalSearchCompleter()
        
        return completer
    }
    
    func factorySearch(place:String) -> MKLocalSearch
    {
        let searchRequest:MKLocalSearchRequest = MKLocalSearchRequest()
        searchRequest.naturalLanguageQuery = place
        
        let localSearch:MKLocalSearch = MKLocalSearch(
            request:searchRequest)
        
        return localSearch
    }
}
