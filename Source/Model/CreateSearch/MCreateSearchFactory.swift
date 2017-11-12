import MapKit

extension MCreateSearch
{
    //MARK: internal
    
    func factorySearch(place:String) -> MKLocalSearch
    {
        let searchRequest:MKLocalSearchRequest = MKLocalSearchRequest()
        searchRequest.naturalLanguageQuery = place
        
        let localSearch:MKLocalSearch = MKLocalSearch(
            request:searchRequest)
        
        return localSearch
    }
}
